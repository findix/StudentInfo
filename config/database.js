var mongoose = require('mongoose');
var mongoDatabaseURI = 'mongodb://localhost/studentinfo';

mongoose.connect(mongoDatabaseURI);

mongoose.connection.on('connected', function() {
	console.log('Mongoose default connection open to ' + mongoDatabaseURI);
});

mongoose.connection.on('error', function(err) {
	console.log('Mongoose default connection error: ' + err);
});

mongoose.connection.on('disconnected', function() {
	console.log('Mongoose default connection disconnected');
});

// TODO: load all model files from directory model.
require('../model/Student');
require('../model/Course');