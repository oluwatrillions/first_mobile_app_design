const Users = require("../../model/users/signup");
const bcrypt = require("bcrypt");

const handleLogin = async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res
      .status(400)
      .json({ message: "Please enter your email and password" });
  }
  const user = await Users.findOne({ email: email }).exec();

  if (!user) return res.status(400).json({ message: "User does not exist" });

  const userPwd = await bcrypt.compare(password, user.password);

  if (userPwd) {
    const payload = {
      email: user.email,
      username: user.username,
    };

    const signedInUser = await user.save();
    return res.status(200).json({
      message: `${signedInUser.username} logged in successfully`,
      payload,
    });
  } else {
    return res.status(401).json({ message: "Invalid password" });
  }
};

module.exports = handleLogin;
