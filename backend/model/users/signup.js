const mongoose = require("mongoose");
const userSchema = mongoose.Schema;

const Users = new userSchema({
  name: {
    type: String,
    minlength: 4,
    maxlength: 255,
  },
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
  },
  registeredAt: {
    type: Date,
    default: Date.now(),
  },
  accessToken: {
    type: String,
  },
  refreshToken: {
    type: String,
  },
});

module.exports = mongoose.model("users", Users);
