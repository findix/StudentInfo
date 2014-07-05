mongoose = require 'mongoose'

_Course = new mongoose.Schema
    cno:
        type:'String'
        required:true
    cname:
        type:'String'
        required:true
    credit:
        type: Number
        default: 0
    teacher: String

module.exports = mongoose.model 'Course', _Course