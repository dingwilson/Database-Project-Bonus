const express = require('express');
const logger = require('morgan');
cont bodyParser = require('body-parser');

//Set up express app
const app = express();

//Log requests to the console
app.use(logger('dev'));

//Parse incomving requests data
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

//Setup a deault catch-all route that sends back a welcome message in JSON ormat
app.get('*', (req,res) => res.status(200).send({
	message: 'Welcome to the beginnig of nothingness.',
}));

module.exports = app;


