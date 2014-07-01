/**
 * Created by Sean on 2014/7/1.
 */
var mongoose = require('mongoose');

var _Grade = new mongoose.Schema({
    student: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Student'
    },
    Course: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Course'
    },
    score:{
        type:Number,
        default:0
    }
});

module.exports = mongoose.model('Grade', _Grade);