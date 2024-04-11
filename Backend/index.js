// const mongoose = require("mongoose");
// const express = require("express");
const app = require('./app.js');
// const cors = require("cors");
const db = require('./src/config/db.js')
// const bodyParser = require("body-parser");
// const routes = require("./src/routes/routes.js")
const User = require('./src/model/model.js')

const port = 3000;

// app.use(bodyParser.urlencoded({ extended: true }));
// app.use(bodyParser.json());
// app.use(cors());

// app.use("/", routes);

app.get('/',(req,res)=>{
    res.send("Hello")
});

app.listen(port,()=>{
    console.log(`Server is running on port http://localhost:${port}`);
})