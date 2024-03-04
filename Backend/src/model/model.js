const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const userSchema = new Schema({
  userId: String,
  userName: String,
  userNumber: {
    type: Number,
    validate: {
      validator: Number.isInteger,
      message: "{VALUE} is not an integer",
    },
  },
  userEmail: String,
  location: String,
});

const reports = new Schema({
  reportId: String,
  userId: String,
  waterLevelId: String,
  location: String,
  time: String,
});

const guest = new Schema({
  guestId: String,
  guestEmail: String,
  guestName: String,
  location: String,
});

const notification = new Schema({
  notificationId: String,
  message: String,
  userId: String,
  notificationType: String,
});

const ngo = new Schema({
  ngoName: String,
  ngoEmail: String,
  ngoNumber: String,
});

const mlModel = new Schema({
  modelId: String,
  trainingData: String,
  modelType: String,
});

const waterLevel = new Schema({
  waterLevelId: String,
  location: String,
  time: Date,
  waterLevelUnit: String,
});

const User = mongoose.model("User", userSchema);
const Report = mongoose.model("Report", reports);
const Guest = mongoose.model("Guest", guest);
const Notification = mongoose.model("Notification", notification);
const Ngo = mongoose.model("Ngo", ngo);
const Mlmodel = mongoose.model("Mlmodel", mlModel);
const WaterLevel = mongoose.model("WaterLevel", waterLevel);

module.exports = { User, Report, Guest, Notification, Ngo, Mlmodel, WaterLevel };
