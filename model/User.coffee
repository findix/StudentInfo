mongoose = require 'mongoose'

_User = new mongoose.Schema
    _id: mongoose.Schema.Types.ObjectId
    username: String
    password: String

module.exports = mongoose.model 'User', _User