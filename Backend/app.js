const express = require('express');
const body_parser = require('body-parser');
const userRouter = require('./src/routes/routes')

const app = express();

app.use(body_parser.json());

app.use('/',userRouter);

module.exports = app;