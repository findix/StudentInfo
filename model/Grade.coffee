mongoose = require 'mongoose'

_Grade = new mongoose.Schema
    student:
        type: mongoose.Schema.Types.ObjectId
        ref: 'Student'
        required:true
    Course:
        type: mongoose.Schema.Types.ObjectId
        ref: 'Course'
        required:true
    score:
        type: Number
        default: 0

module.exports = mongoose.model 'Grade', _Grade