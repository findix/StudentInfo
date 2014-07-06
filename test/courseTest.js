// Generated by CoffeeScript 1.7.1
(function() {
  var courseEntity, courseModel, db, mongoose;

  db = require('../config/database');

  mongoose = require('mongoose');

  courseModel = require("../model/Course");

  courseEntity = new courseModel({
    cno: 200001,
    cname: 'Think in Swift',
    credit: 6,
    teacher: 'Steve Jobs'
  });

  courseEntity.save();

}).call(this);

//# sourceMappingURL=courseTest.map
