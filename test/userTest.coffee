db = require('../config/database');

mongoose = require('mongoose');
user = require('../model/user');

userEntity = new user
    username: '1234567890'
    password: '123456'
userEntity.save()

