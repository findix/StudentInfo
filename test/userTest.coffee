db = require('../config/database');

user = require('../model/User');

userEntity = new user
    username: '2013000001'
    password: '123456'
userEntity.save()

user.findOne
    username:1234567890,
    (err,data)->
        console.log data._id
