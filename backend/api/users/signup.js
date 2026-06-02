const express = require("express");
const router = express.Router();
const { handleSignup } = require("../../controllers/users/signup");
const { upload } = require("../../controllers/users/signup");

router.post("/", upload, handleSignup);

module.exports = router;
