/**
 * Created by Sean on 2014/7/1.
 */
var mongoose = require('mongoose');

var _Student = new mongoose.Schema({
    sno:String,
    sname:String,
    birthday:{
        type: Date,
        default: Date.now
    },
    gender:String,
    class:String,
    department:String
});

module.exports = mongoose.model('Student', _Student);