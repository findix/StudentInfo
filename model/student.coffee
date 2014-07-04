mongoose = require 'mongoose'

_Student = new mongoose.Schema
    _id: mongoose.Schema.Types.ObjectId
    sno: String
    sname: String
    birthday:
        type: Date
        default: Date.now
    gender: String
    class: String
    department: String

module.exports = mongoose.model 'Student', _Student