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
  addNgo,
  getNgo,
  addMlmodel,
  getMlmodel,
  addWaterlevel,
  getWaterlevel,
} = require("../controller/controller.js");

router.route("/").get(getUser).post(addNewUser);
router.route("/report").post(addReport).get(getReport);
router.route("/guest").get(getGuest).post(addGuest);
router.route("/notification").get(getNotification).post(addNotification);
router.route("/ngo").get(getNgo).post(addNgo);
router.route("/Mlmodel").get(getMlmodel).post(addMlmodel);
router.route("/waterLevel").get(getWaterlevel).post(addWaterlevel);

module.exports = router;
