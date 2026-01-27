const Users = require("../../model/users/signup");

const handleLogin = async (req, res) => {
  let { email, password } = req.body;

  if (!email || !password) {
    return res
      .status(400)
      .json({ message: "Please enter your email and password" });
  }
  const user = await Users.findOne({ email }).exec();

  if (!user) {
    return res.status(400).json({ message: "User does not exist" });
  }

  const payload = {
    email: user.email,
    password: user.password,
  };
  return res.status(200).json({ message: "Login successful", payload });
};

module.exports = handleLogin;
