const express = require("express");
const router = express.Router();

const {
  addNewUser,
  getUser,
  addReport,
  getReport,
  addGuest,
  getGuest,
  addNotification,
  getNotification,
} = require("../controller/controller.js");

router.route("/").get(getUser).post(addNewUser);
router.route("/report").post(addReport).get(getReport);
router.route("/guest").get(getGuest).post(addGuest);
router.route("/notification").get(getNotification).post(addNotification);

module.exports = router;
