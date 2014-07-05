mongoose = require 'mongoose'

_User = new mongoose.Schema
    username:
        type: String
        required: true
    password:
        type: String
        required: true

module.exports = mongoose.model 'User', _User