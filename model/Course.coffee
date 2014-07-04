mongoose = require 'mongoose'

_Course = new mongoose.Schema
    _id: mongoose.Schema.Types.ObjectId
    cno: String
    cname: String
    credit:
        type: Number
        default: 0
    teacher: String

module.exports = mongoose.model 'Course', _Course