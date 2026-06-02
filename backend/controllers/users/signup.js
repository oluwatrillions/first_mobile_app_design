const Users = require("../../model/users/signup");
const validateEmail = require("email-validator");
const path = require("path");
const bcrypt = require("bcrypt");
const multer = require("multer");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, path.join(__dirname, "../../public/avatar/"));
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + "_" + file.originalname);
  },
});

const upload = multer({
  storage: storage,
  limits: {
    fieldSize: 1024 * 1024 * 3,
  },
}).single("avatar");

const handleSignup = async (req, res) => {
  let { username, email, password, name } = req.body;

  if (!username || !email || !password) {
    return res
      .status(400)
      .json({ message: "Please enter the following fields" });
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
      email: req.body.email,
      password: hashedPwd,
      avatar: req.file ? req.file.filename : "../../public/avatar/default.png",
    });

    if (newUser) {
      res.status(201).json({
        newUser,
        message: "Account successfully created",
      });
    } else {
      res.status(400).json({ message: "Invalid user" });
    }
  } catch (error) {
    console.log(error);
  }
};

module.exports = { handleSignup, upload };
