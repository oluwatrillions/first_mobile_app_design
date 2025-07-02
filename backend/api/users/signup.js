const express = require("express");
const router = express.Router();
const handleSignup = require("../../controllers/users/signup");

router.post("/", handleSignup);

module.exports = router;
