const Users = require("../../model/users/signup");
const jwt = require("jsonwebtoken");

const handleRefreshToken = async (req, res) => {
  const { refreshToken } = req.body;

  if (!refreshToken) return res.status(401).json({ message: "Unauthorized" });

  try {
    const user = await Users.findOne({ refreshToken }).exec();
    if (!user)
      return res.status(403).json({ message: "Invalid refresh token" });

    jwt.verify(
      refreshToken,
      process.env.REFRESH_TOKEN_SECRET,
      (err, decoded) => {
        if (err || user.email !== decoded.email)
          return res.status(403).json({ message: "Invalid refresh token" });

        const payload = {
          name: user.name,
          username: user.username,
          email: user.email,
        };

        const newAccessToken = jwt.sign(
          payload,
          process.env.ACCESS_TOKEN_SECRET,
          { expiresIn: "15m" },
        );
        res.json({ accessToken: newAccessToken });
      },
    );
  } catch (error) {
    res.status(500).json({ message: "Internal server error" });
  }
};

module.exports = { handleRefreshToken };
