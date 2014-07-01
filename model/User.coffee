mongoose = require 'mongoose'

_User = new mongoose.Schema
    username: String
    password: String

module.exports = mongoose.model 'User', _User