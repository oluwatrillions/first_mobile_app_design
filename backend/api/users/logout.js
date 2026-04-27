const express = require("express");
const router = express.Router();
const handleLogout = require("../../controllers/users/logout");

router.post("/logout", handleLogout);

module.exports = router;
