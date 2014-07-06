db = require('../config/database');
mongoose = require 'mongoose'

courseModel = require "../model/Course"

courseEntity=new courseModel(
    cno:200001
    cname:'Think in Swift'
    credit:6
    teacher: 'Steve Jobs'
)
courseEntity.save()

