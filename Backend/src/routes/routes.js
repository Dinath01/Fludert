const express = require("express");
const router = express.Router();

const {
  // User
  addNewUser,
  getUser,
  deleteUser,
  updateUser,

  // report
  addReport,
  getReport,
  deleteReport,
  updateReport,

  // Guest
  addGuest,
  getGuest,
  deleteGuest,
  updateGuest,

  // notification
  addNotification,
  getNotification,
  deleteNotifications,
  updateNotifications,

  // Ngo
  addNgo,
  getNgo,
  deleteNgo,
  updateNgo,

  // Ml model
  addMlmodel,
  getMlmodel,

  // water level
  addWaterlevel,
  getWaterlevel,
  deleteWaterlevel,
  updateWaterlevel,

  // location
  addLocation,
  getLocation,
  deleteLocation,
  updateLocation,

  // User Admin
  addUserAdmin,
  getUserAdmin,
  deleteUserAdmin,
  updateUserAdmin,

  // weather Data
  addWeatherData,
  getWeatherData,
  deleteWeatherData,
  updateWeatherData,
  deleteMlmodel,
  updateMlmodel,
} = require("../controller/controller.js");

router.route("/").get(getUser).post(addNewUser);
router.route("/:id").delete(deleteUser);
router.route("/:id").put(updateUser);

router.route("/report").post(addReport).get(getReport);
router.route("/report/:id").delete(deleteReport);
router.route("/report/:id").put(updateReport);

router.route("/guest").get(getGuest).post(addGuest);
router.route("/guest/:id").delete(deleteGuest);
router.route("/guest/:id").put(updateGuest);

router.route("/notification").get(getNotification).post(addNotification);
router.route("/notification/:id").delete(deleteNotifications);
router.route("/notification/:id").put(updateNotifications);

router.route("/ngo").get(getNgo).post(addNgo);
router.route("/ngo/:id").delete(deleteNgo);
router.route("/ngo/:id").put(updateNgo);

router.route("/Mlmodel").get(getMlmodel).post(addMlmodel);
router.route("/Mlmodel/:id").delete(deleteMlmodel);
router.route("/Mlmodel/:id").put(updateMlmodel);

router.route("/waterLevel").get(getWaterlevel).post(addWaterlevel);
router.route("/waterLevel/:id").delete(deleteWaterlevel);
router.route("/waterLevel/:id").put(updateWaterlevel);

router.route("/location").get(getLocation).post(addLocation);
router.route("/location/:id").delete(deleteLocation);
router.route("/location/:id").put(updateLocation);

router.route("/admin").get(getUserAdmin).post(addUserAdmin);
router.route("/admin/:id").delete(deleteUserAdmin);
router.route("/admin/:id").put(updateUserAdmin);

router.route("/weatherData").get(getWeatherData).post(addWeatherData);
router.route("/weatherData/:id").delete(deleteWeatherData);
router.route("/weatherData/:id").put(updateWeatherData);

module.exports = router;
