const express = require("express");
const router = express.Router();

const {
  addNewUser,
  getUser,
  addReport,
  getReport,
} = require("../controller/controller.js");

router.route("/").get(getUser).post(addNewUser);

router.route("/report").post(addReport).get(getReport);

module.exports = router;
