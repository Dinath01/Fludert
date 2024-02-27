const express = require("express");
const router = express.Router();

const {
  addNewUser,
  getUser,
  addReport,
  getReport,
  addGuest,
  getGuest,
  addNotifications,
  getNotifications
} = require("../controller/controller.js");

router.route("/").get(getUser).post(addNewUser);

router.route("/report").post(addReport).get(getReport);

router.route("/guest").post(addGuest).get(getGuest);

router.route("/notification").post(addNotifications).get(getNotifications);



module.exports = router;
