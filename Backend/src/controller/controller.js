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

module.exports = {
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
  addLocation,
  getLocation,
  addUserAdmin,
  getUserAdmin,
  addWeatherData,
  getWeatherData,
};
