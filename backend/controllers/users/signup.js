const Users = require("../../model/users/signup");
const validateEmail = require("email-validator");

const handleSignup = async (req, res) => {
  let { name, email, password } = req.body;
  if (!name || !email || !password) {
    return res.json({ message: "Please enter the following fields" });
  }

  const user = await Users.findOne({ email }).exec();
  if (user) {
    return res.status(409).json({ message: "User exists." });
  }

  const userEmail = validateEmail.validate(req.body.email);
  if (!userEmail) {
    return res.status(400).json("Invalid email");
  }

  try {
    // const hashedPwd = await bcrypt.hash(password, 12);

    const newUser = await Users.create({
      name: req.body.name,
      username: req.body.username,
      email,
      password: req.body.password,
    });

    if (newUser) {
      //   const verificationToken = newUser.generateVerificationToken();

      //   await newUser.save({ validateBeforeSave: false });

      //   const frontendURL = "http://localhost:5173";
      //   const verificationUrl = `${frontendURL}/verify/${verificationToken}`;

      //   const message = `Please verify your email by clicking the link: ${verificationUrl}`;

      //   await sendVerificationEmail({
      //     email: newUser.email,
      //     subject: "Email Verification",
      //     message,
      //   });

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
