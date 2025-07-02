const mongoose = require("mongoose");
const userSchema = mongoose.Schema;

const Users = new userSchema({
  name: {
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
  //   scope: {
  //     type: String,
  //     enum: ["local", "google"],
  //   },
  //   roles: {
  //     type: String,
  //     enum: ["user", "admin"],
  //     default: "user",
  //   },
  //   profileImage: {
  //     type: String,
  //   },
  registeredAt: {
    type: Date,
    default: Date.now(),
  },
  //   verificationToken: String,
  //   verificationTokenExpiry: Date,
  //   refreshToken: String,
  //   isVerified: {
  //     type: Boolean,
  //     default: false,
  //   },
});

module.exports = mongoose.model("Users", Users);
