db = require('../config/database');
mongoose = require 'mongoose'

studentModel = require('../model/Student');

#for i in [20113092..20113122]
#    studentEntity = new student
#        sno: '' + i
#        sname: '' + i
#        gender: if Math.random() > 0.5 then '男' else '女'
#        class: '2011221'
#        department: '软件工程系'
#    console.log studentEntity
#    studentEntity.save((err)->if err?
#        console.log err)


#studentEntity=new studentModel
#    sno: '123456'
#    sname: '123456'
#    gender: '男'
#    class: '123456'
#    department: '123456'
#    birthday: new Date()
#studentEntity.save()