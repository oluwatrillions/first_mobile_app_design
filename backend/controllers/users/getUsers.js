const users = require("../../model/users/signup");

const getUsers = async (req, res) => {
  const usersList = await users.find();
  console.log(usersList);

  if (!usersList) {
    return res.status(404).json({ message: "No users found" });
  }
  res.status(200).json(usersList);
};

module.exports = getUsers;
