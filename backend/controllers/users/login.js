const Users = require("../../model/users/signup");
const bcrypt = require("bcrypt");

const handleLogin = async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res
      .status(400)
      .json({ message: "Please enter your email and password" });
  }

  try {
    const user = await Users.findOne({ email: email }).exec();

    if (!user)
      return res.status(401).json({ message: "Invalid email or password" });

    const userPwd = await bcrypt.compare(password, user.password);

    if (userPwd) {
      const payload = {
        email: user.email,
        username: user.username,
      };

      return res.status(200).json({
        message: `${user.username} logged in successfully`,
        payload,
      });
    } else {
      return res.status(401).json({ message: "Invalid email or password" });
    }
  } catch (error) {
    console.log("Login error", error);
    return res.status(500).json({ message: "server error" });
  }
};

module.exports = handleLogin;
