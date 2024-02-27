const { User, Report, Guest, Notifications } = require("../model/model.js");

// User

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


// Report

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
  User.find({})
    .then((report) => {
      res.json(report);
    })
    .catch((error) => {
      res.send(error);
    });
};


// Guest

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
  User.find({})
    .then((guest) => {
      res.json(guest);
    })
    .catch((error) => {
      res.send(error);
    });
};

// notification

const addNotifications = (req,res)=>{
  const newUser = new Notifications(req.body);
  newUser
  .save()
  .then((notification) =>{
    res.json(notification);
  })
  .catch((error) =>{
    res.json(error)
  })
}

const getNotifications = (req, res) => {
  User.find({})
    .then((notification) => {
      res.json(notification);
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
  addNotifications,
  getNotifications
};
