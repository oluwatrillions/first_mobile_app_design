const Users = require("../../model/users/signup");

const handleLogout = async (req, res) => {
  const { refreshToken } = req.body;

  if (!refreshToken) return res.status(400).json({ message: "Bad Request" });

  try {
    const user = await Users.findOne({ refreshToken }).exec();

    if (user) {
      user.refreshToken = "";

      await user.save();
      return res
        .status(200)
        .json({ message: `${user.username} logged out successfully` });
    }
  } catch (error) {
    return res.status(500).json({ message: "Internal server error" });
  }
};

module.exports = { handleLogout };
