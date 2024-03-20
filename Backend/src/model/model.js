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
  userEmail: {
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
  location: String,
  reports: [
    {
      type: Schema.Types.ObjectId,
      ref: "Report",
    },
  ],
  waterLevels: [
    {
      type: Schema.Types.ObjectId,
      ref: "WaterLevel",
    },
  ],
  notifications: [
    {
      type: Schema.Types.ObjectId,
      ref: "Notification",
    },
  ],
  ngo: {
    type: Schema.Types.ObjectId,
    ref: "Ngo",
  },
  locations: [
    {
      type: Schema.Types.ObjectId,
      ref: "Location",
    },
  ],
  // Adding an array of references to weather data
  weatherData: [
    {
      type: Schema.Types.ObjectId,
      ref: "WeatherData",
    },
  ],
});

const reports = new Schema({
  reportId: String,
  waterLevelId: String,
  location: String,
  time: {
    type: Date,
    validate: {
      validator: function (v) {
        // Check if v is a valid Date object
        return !isNaN(new Date(v));
      },
      message: (props) => `${props.value} is not a valid date!`,
    },
  },
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
  // Adding an array of references to locations
  locations: [
    {
      type: Schema.Types.ObjectId,
      ref: "Location",
    },
  ],
  // Adding an array of references to weather data
  weatherData: [
    {
      type: Schema.Types.ObjectId,
      ref: "WeatherData",
    },
  ],
});

const notification = new Schema({
  notificationId: String,
  message: String,
  userId: String,
  notificationType: String,
  // Adding an array of references to locations
  locations: [
    {
      type: Schema.Types.ObjectId,
      ref: "Location",
    },
  ],
});

const ngo = new Schema({
  ngoName: String,
  ngoEmail: {
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
  ngoNumber: String,
});

const mlModel = new Schema({
  modelId: String,
  trainingData: String,
  modelType: String,
  // Adding an array of references to users
  users: [
    {
      type: Schema.Types.ObjectId,
      ref: "User",
    },
  ],
  // Adding an array of references to weather data
  weatherData: [
    {
      type: Schema.Types.ObjectId,
      ref: "WeatherData",
    },
  ],
});

const waterLevel = new Schema({
  waterLevelId: String,
  location: String,
  time: {
    type: Date,
    validate: {
      validator: function (v) {
        // Check if v is a valid Date object
        return !isNaN(new Date(v));
      },
      message: (props) => `${props.value} is not a valid date!`,
    },
  },
  waterLevelUnit: String,
});

const location = new Schema({
  locationId: String,
  userId: String,
  time: {
    type: Date,
    validate: {
      validator: function (v) {
        // Check if v is a valid Date object
        return !isNaN(new Date(v));
      },
      message: (props) => `${props.value} is not a valid date!`,
    },
  },
  latitude: String,
  longitude: String,
});

const userAdmin = new Schema({
  adminId: String,
  adminName: String,
  adminEmail: {
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
  // Adding an array of references to users
  users: [
    {
      type: Schema.Types.ObjectId,
      ref: "User",
    },
  ],
  // Adding an array of references to weather data
  weatherData: [
    {
      type: Schema.Types.ObjectId,
      ref: "WeatherData",
    },
  ],
});

const weatherData = new Schema({
  dataId: String,
  time: {
    type: Date,
    validate: {
      validator: function (v) {
        // Check if v is a valid Date object
        return !isNaN(new Date(v));
      },
      message: (props) => `${props.value} is not a valid date!`,
    },
  },
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
