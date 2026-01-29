const Users = require("../../model/users/signup");
const validateEmail = require("email-validator");
const bcrypt = require("bcrypt");

const handleSignup = async (req, res) => {
  let { username, email, password, name } = req.body;
  if (!username || !email || !password) {
    return res.json({ message: "Please enter the following fields" });
  }

  const user = await Users.findOne({ email }).exec();
  if (user) {
    return res.status(409).json({ message: "User exists." });
  }

  const userEmail = validateEmail.validate(req.body.email);
  if (!userEmail) {
    return res.status(400).json({ message: "Invalid email" });
  }

  try {
    const hashedPwd = await bcrypt.hash(password, 12);

    const newUser = await Users.create({
      name: req.body.name,
      username: req.body.username,
      email,
      password: hashedPwd,
    });

    if (newUser) {
      res.status(201).json({
        newUser,
        status: "success",
        message: "Account successfully created",
      });
    } else {
      res.status(400).json({ message: "Invalid user" });
    }
  } catch (error) {
    console.log(error);
  }
};

module.exports = handleSignup;
