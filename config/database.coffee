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

require "../model/Grade"
require "../model/course"
require "../model/Student"
require "../model/User"

