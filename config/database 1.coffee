mongoose = require 'mongoose'

#mongoDatabaseURI = 'mongodb://admin:admin@kahana.mongohq.com:10003/studentinfo'
mongoDatabaseURI = 'mongodb://localhost:27017/studentinfo'

mongoose.connect mongoDatabaseURI

mongoose.connection.on('connected', () ->
    console.log('Mongoose default connection open to ' + mongoDatabaseURI)
)

mongoose.connection.on('error', (err)->
    console.log('Mongoose default connection error: ' + err)
)

mongoose.connection.on('disconnected', ()->
    console.log('Mongoose default connection disconnected')
)

studentModel = require "../model/Student"
gradeModel = require "../model/Grade"
courseModel = require "../model/Course"
userModel=require "../model/User"