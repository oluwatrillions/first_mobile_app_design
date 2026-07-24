const mongoose = require("mongoose");
const userSchema = mongoose.Schema;

const Users = new userSchema({
  // _id: {
  //   type: mongoose.Schema.Types.ObjectId,
  //   unique: true,
  // },
  username: {
    type: String,
    minlength: 4,
    maxlength: 255,
    required: true,
  },
  email: {
    type: String,
    unique: true,
    required: true,
  },
  password: {
    type: String,
    minlength: 4,
    maxlength: 255,
    required: true,
  },
  avatar: {
    type: String,
    required: true,
  },
  registeredAt: {
    type: Date,
    required: true,
    default: Date.now,
  },
  refreshToken: {
    type: String,
  },
});

module.exports = mongoose.model("users", Users);
