const { User, Report, Guest, Notification } = require("../model/model.js");

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

module.exports = {
  addNewUser,
  getUser,
  addReport,
  getReport,
  addGuest,
  getGuest,
  addNotification,
  getNotification,
};
