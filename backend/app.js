const path = require('path');
const express = require('express');
const app = express();
const http = require('http').createServer(app);
const cors = require("cors");
const bodyParser = require('body-parser');

//require database file 
require('./database/connection');

const router = express.Router()

const userRoutes = require('./database/userroute');

app.use(cors());

app.use(bodyParser.urlencoded({
  extended: false
}));

app.use(bodyParser.json()); // to give Express the ability to read JSON payloads from the HTTP request body

app.use(express.json());

//router
app.use(userRoutes);


// start server
const port = '1000';
app.set('port',port);


//ip of connected wifi
http.listen(1000, '192.168.1.68');

app.use(function (err, req, res, next) {
  console.error(err.message);
  if (!err.statusCode) err.statusCode = 500;
  res.status(err.statusCode).send(err.message);
});