const Users = require("../../model/users/signup");

const handleLogout = async (req, res) => {
  const { email } = req.body;

  try {
    const user = await Users.findOne({ email: email }).exec();

    if (user) {
      user.email = "";

      await user.save();
      return res
        .status(200)
        .json({ message: `${user.username} logged out successfully` });
    }
  } catch (error) {
    return res.status(500).json({ message: "Internal server error" });
  }
};

module.exports = handleLogout;
