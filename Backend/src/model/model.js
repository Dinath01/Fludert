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
  user: {
    type: Schema.Types.ObjectId,
    ref: "User",
  },
  waterLevelId: String,
  location: String,
  time: String,
});

const guest = new Schema({
  guestId: String,
  guestEmail: {
    type: String,
    required: true,
    unique: true,
    validate: {
      validator: function (value) {
        return /@gmail\.com$/.test(value);
      },
      message:
        "Invalid email format. Please use an email address ending with @gmail.com",
    },
  },
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

const location = new Schema({
  locationId: String,
  userId: String,
  time: Date,
  latitude: String,
  longitude: String,
});

const userAdmin = new Schema({
  adminId: String,
  adminName: String,
  adminEmail: String,
});

const weatherData = new Schema({
  dataId: String,
  time: Date,
  location: String,
  rainfallData: String,
});

const User = mongoose.model("User", userSchema);
const Report = mongoose.model("Report", reports);
const Guest = mongoose.model("Guest", guest);
const Notification = mongoose.model("Notification", notification);
const Ngo = mongoose.model("Ngo", ngo);
const Mlmodel = mongoose.model("Mlmodel", mlModel);
const WaterLevel = mongoose.model("WaterLevel", waterLevel);
const Location = mongoose.model("Location", location);
const UserAdmin = mongoose.model("UserAdmin", userAdmin);
const WeatherData = mongoose.model("WhetherData", weatherData);

module.exports = {
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
};
