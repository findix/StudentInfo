// Generated by CoffeeScript 1.7.1
(function() {
  var db, user, userEntity;

  db = require('../config/database');

  user = require('../model/User');

  userEntity = new user({
    username: '2013000001',
    password: '123456'
  });

  userEntity.save();

  user.findOne({
    username: 1234567890
  }, function(err, data) {
    return console.log(data._id);
  });

}).call(this);

//# sourceMappingURL=userTest.map
