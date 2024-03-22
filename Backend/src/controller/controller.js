const {
  User,
  Report,
  Guest,
  Notification,
  Ngo,
  Mlmodel,
  WaterLevel,
  Location,
  UserAdmin,
  WeatherData,
} = require("../model/model.js");

// CRUD of User
const addNewUser = (req, res) => {
  const newUser = new User(req.body);
  newUser
    .save()
    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.send(error);
    });
};

const getUser = (req, res) => {
  User.find({})
    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.send(error);
    });
};

const deleteUser = (req, res) => {
  const userId = req.params.id;
  User.findByIdAndDelete(userId)
    .then((user) => {
      if (!userId) {
        res.status(400).send("User Not Found");
      }
      res.send("User deleted Successfull");
    })
    .catch((error) => {
      res.json(error);
    });
};

const updateUser = (req, res) => {
  const userId = req.params.id;
  const updateData = req.body;

  User.findByIdAndUpdate(userId, updateData, { new: true })

    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.json(error);
    });
};

// CRUD of Report
const addReport = (req, res) => {
  const newUser = new Report(req.body);
  newUser
    .save()
    .then((report) => {
      res.json(report);
    })
    .catch((error) => {
      res.send(error);
    });
};

const getReport = (req, res) => {
  Report.find({})
    .then((report) => {
      res.json(report);
    })
    .catch((error) => {
      res.send(error);
    });
};

const deleteReport = (req, res) => {
  const userId = req.params.id;
  Report.findByIdAndDelete(userId)
    .then((user) => {
      if (!userId) {
        res.status(400).send("User Not Found");
      }
      res.send("User deleted Successfull");
    })
    .catch((error) => {
      res.json(error);
    });
};

const updateReport = (req, res) => {
  const userId = req.params.id;
  const updateData = req.body;

  Report.findByIdAndUpdate(userId, updateData, { new: true })

    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.json(error);
    });
};

// CRUD of Guest
const addGuest = (req, res) => {
  const newUser = new Guest(req.body);
  newUser
    .save()
    .then((guest) => {
      res.json(guest);
    })
    .catch((error) => {
      res.send(error);
    });
};

const getGuest = (req, res) => {
  Guest.find({})
    .then((guest) => {
      res.json(guest);
    })
    .catch((error) => {
      res.send(error);
    });
};

const deleteGuest = (req, res) => {
  const userId = req.params.id;
  Guest.findByIdAndDelete(userId)
    .then((user) => {
      if (!userId) {
        res.status(400).send("User Not Found");
      }
      res.send("User deleted Successfull");
    })
    .catch((error) => {
      res.json(error);
    });
};

const updateGuest = (req, res) => {
  const userId = req.params.id;
  const updateData = req.body;

  Guest.findByIdAndUpdate(userId, updateData, { new: true })

    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.json(error);
    });
};

// CRUD of Notification
const addNotification = (req, res) => {
  const newUser = new Notification(req.body);
  newUser
    .save()
    .then((notification) => {
      res.json(notification);
    })
    .catch((error) => {
      res.send(error);
    });
};

const getNotification = (req, res) => {
  Notification.find({})
    .then((notification) => {
      res.json(notification);
    })
    .catch((error) => {
      res.send(error);
    });
};

const deleteNotifications = (req, res) => {
  const userId = req.params.id;
  Notification.findByIdAndDelete(userId)
    .then((user) => {
      if (!userId) {
        res.status(400).send("User Not Found");
      }
      res.send("User deleted Successfull");
    })
    .catch((error) => {
      res.json(error);
    });
};

const updateNotifications = (req, res) => {
  const userId = req.params.id;
  const updateData = req.body;

  Notification.findByIdAndUpdate(userId, updateData, { new: true })

    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.json(error);
    });
};

// CRUD of Ngo
const addNgo = (req, res) => {
  const newUser = new Ngo(req.body);
  newUser
    .save()
    .then((ngo) => {
      res.json(ngo);
    })
    .catch((error) => {
      res.send(error);
    });
};

const getNgo = (req, res) => {
  Ngo.find({})
    .then((ngo) => {
      res.json(ngo);
    })
    .catch((error) => {
      res.send(error);
    });
};

const deleteNgo = (req, res) => {
  const userId = req.params.id;
  Ngo.findByIdAndDelete(userId)
    .then((user) => {
      if (!userId) {
        res.status(400).send("User Not Found");
      }
      res.send("User deleted Successfull");
    })
    .catch((error) => {
      res.json(error);
    });
};

const updateNgo = (req, res) => {
  const userId = req.params.id;
  const updateData = req.body;

  Ngo.findByIdAndUpdate(userId, updateData, { new: true })

    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.json(error);
    });
};

// CRUD of ML model
const addMlmodel = (req, res) => {
  const newUser = new Mlmodel(req.body);
  newUser
    .save()
    .then((Mlmodel) => {
      res.json(Mlmodel);
    })
    .catch((error) => {
      res.send(error);
    });
};

const getMlmodel = (req, res) => {
  Mlmodel.find({})
    .then((Mlmodel) => {
      res.json(Mlmodel);
    })
    .catch((error) => {
      res.send(error);
    });
};

const deleteMlmodel = (req, res) => {
  const userId = req.params.id;
  Mlmodel.findByIdAndDelete(userId)
    .then((user) => {
      if (!userId) {
        res.status(400).send("User Not Found");
      }
      res.send("User deleted Successfull");
    })
    .catch((error) => {
      res.json(error);
    });
};

const updateMlmodel = (req, res) => {
  const userId = req.params.id;
  const updateData = req.body;

  Mlmodel.findByIdAndUpdate(userId, updateData, { new: true })

    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.json(error);
    });
};

// CRUD of WaterLevel
const addWaterlevel = (req, res) => {
  const newUser = new WaterLevel(req.body);
  newUser
    .save()
    .then((waterLevel) => {
      res.json(waterLevel);
    })
    .catch((error) => {
      res.send(error);
    });
};

const getWaterlevel = (req, res) => {
  WaterLevel.find({})
    .then((waterLevel) => {
      res.json(waterLevel);
    })
    .catch((error) => {
      res.send(error);
    });
};

const deleteWaterlevel = (req, res) => {
  const userId = req.params.id;
  WaterLevel.findByIdAndDelete(userId)
    .then((user) => {
      if (!userId) {
        res.status(400).send("User Not Found");
      }
      res.send("User deleted Successfull");
    })
    .catch((error) => {
      res.json(error);
    });
};

const updateWaterlevel = (req, res) => {
  const userId = req.params.id;
  const updateData = req.body;

  WaterLevel.findByIdAndUpdate(userId, updateData, { new: true })

    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.json(error);
    });
};

// CRUD of Location
const addLocation = (req, res) => {
  const newUser = new Location(req.body);
  newUser
    .save()
    .then((location) => {
      res.json(location);
    })
    .catch((error) => {
      res.send(error);
    });
};

const getLocation = (req, res) => {
  Location.find({})
    .then((location) => {
      res.json(location);
    })
    .catch((error) => {
      res.send(error);
    });
};

const deleteLocation = (req, res) => {
  const userId = req.params.id;
  Location.findByIdAndDelete(userId)
    .then((user) => {
      if (!userId) {
        res.status(400).send("User Not Found");
      }
      res.send("User deleted Successfull");
    })
    .catch((error) => {
      res.json(error);
    });
};

const updateLocation = (req, res) => {
  const userId = req.params.id;
  const updateData = req.body;

  Location.findByIdAndUpdate(userId, updateData, { new: true })

    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.json(error);
    });
};

// CRUD of UserAdmin
const addUserAdmin = (req, res) => {
  const newUser = new UserAdmin(req.body);
  newUser
    .save()
    .then((userAdmin) => {
      res.json(userAdmin);
    })
    .catch((error) => {
      res.send(error);
    });
};

const getUserAdmin = (req, res) => {
  UserAdmin.find({})
    .then((userAdmin) => {
      res.json(userAdmin);
    })
    .catch((error) => {
      res.send(error);
    });
};

const deleteUserAdmin = (req, res) => {
  const userId = req.params.id;
  UserAdmin.findByIdAndDelete(userId)
    .then((user) => {
      if (!userId) {
        res.status(400).send("User Not Found");
      }
      res.send("User deleted Successfull");
    })
    .catch((error) => {
      res.json(error);
    });
};

const updateUserAdmin = (req, res) => {
  const userId = req.params.id;
  const updateData = req.body;

  UserAdmin.findByIdAndUpdate(userId, updateData, { new: true })

    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.json(error);
    });
};

// CRUD of WeatherData
const addWeatherData = (req, res) => {
  const newUser = new WeatherData(req.body);
  newUser
    .save()
    .then((weatherData) => {
      res.json(weatherData);
    })
    .catch((error) => {
      res.send(error);
    });
};

const getWeatherData = (req, res) => {
  WeatherData.find({})
    .then((weatherData) => {
      res.json(weatherData);
    })
    .catch((error) => {
      res.send(error);
    });
};

const deleteWeatherData = (req, res) => {
  const userId = req.params.id;
  WeatherData.findByIdAndDelete(userId)
    .then((user) => {
      if (!userId) {
        res.status(400).send("User Not Found");
      }
      res.send("User deleted Successfull");
    })
    .catch((error) => {
      res.json(error);
    });
};

const updateWeatherData = (req, res) => {
  const userId = req.params.id;
  const updateData = req.body;

  WeatherData.findByIdAndUpdate(userId, updateData, { new: true })

    .then((user) => {
      res.json(user);
    })
    .catch((error) => {
      res.json(error);
    });
};

// export to the route page
module.exports = {
  addNewUser,
  getUser,
  deleteUser,
  updateUser,

  addReport,
  getReport,
  deleteReport,
  updateReport,

  addGuest,
  getGuest,
  deleteGuest,
  updateGuest,

  addNotification,
  getNotification,
  deleteNotifications,
  updateNotifications,

  addNgo,
  getNgo,
  deleteNgo,
  updateNgo,

  addMlmodel,
  getMlmodel,
  deleteMlmodel,
  updateMlmodel,

  addWaterlevel,
  getWaterlevel,
  deleteWaterlevel,
  updateWaterlevel,

  addLocation,
  getLocation,
  deleteLocation,
  updateLocation,

  addUserAdmin,
  getUserAdmin,
  deleteUserAdmin,
  updateUserAdmin,

  addWeatherData,
  getWeatherData,
  deleteWeatherData,
  updateWeatherData,
};
