const users = require("../../model/users/signup");

const getUser = async (req, res) => {
  const userData = await users.findOne({ _id: req.params.id }).exec();

  if (!userData) {
    return res.status(404).json({ message: "User not found" });
  }
  res.status(200).json(userData);
};

module.exports = getUser;
