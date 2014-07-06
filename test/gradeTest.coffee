db = require('../config/database');
mongoose = require 'mongoose'

gradeModel = require "../model/Grade"

gradeEntity=new gradeModel(
    student:'53b81f0cfb6310cc12ff820f'
    course:'53b8d654805cf358317ff37b'
    score:90
)
gradeEntity.save((err)->
    if err?
        console.log(err)
)