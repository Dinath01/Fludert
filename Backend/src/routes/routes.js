const express = require("express");
const router = express.Router();

const {
  addNewUser,
  getUser,
  addReport,
  getReport,
  addGuest,
  getGuest,
} = require("../controller/controller.js");

router.route("/").get(getUser).post(addNewUser);
router.route("/report").post(addReport).get(getReport);
router.route("/guest").get(getGuest).post(addGuest);

module.exports = router;
