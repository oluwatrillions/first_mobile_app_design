const express = require("express");
const router = express.Router();
const handleLogin = require("../../controllers/users/login");

router.post("/", handleLogin);

module.exports = router;
