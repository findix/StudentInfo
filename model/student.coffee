mongoose = require 'mongoose'

_Student = new mongoose.Schema
    sno:
        type: String
        required: true
    sname:
        type: String
        required: true
    birthday:
        type: Date
        default: Date.now
    gender:
        type: String
        required: true
        enum:['男','女']
    class: String
    department: String

module.exports = mongoose.model 'Student', _Student