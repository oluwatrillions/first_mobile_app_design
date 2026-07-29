const Users = require("../../model/users/signup");

const getUser = async (req, res) => {
  if (!req.params.id) {
    return res.status(400).json({ message: "User ID is required" });
  }

  const userData = await Users.findOne({ _id: req.params.id }).exec();

  if (!userData) {
    return res.status(404).json({ message: "User not found" });
  }
  res.status(200).json(userData);
};

module.exports = getUser;
