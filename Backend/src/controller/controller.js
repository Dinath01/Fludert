const { User, Report } = require("../model/model.js");

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
  User.find({})
    .then((report) => {
      res.json(report);
    })
    .catch((error) => {
      res.send(error);
    });
};
module.exports = { addNewUser, getUser, addReport, getReport };
