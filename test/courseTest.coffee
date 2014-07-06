db = require('../config/database');
mongoose = require 'mongoose'

courseModel = require "../model/Course"

for i in [200002..200010]
    courseEntity = new courseModel(
        cno: i + ''
        cname: "Thinkins in #{i}"
        credit: 6
        teacher: 'Steve Jobs'
    )
    courseEntity.save()

