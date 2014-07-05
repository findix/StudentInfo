express = require "express"
router = express.Router()

studentModel = require "../model/Student"

# GET home page.
router.get "/", (req, res) ->
    unless req.session.username?
        res.redirect '/'
    query = req.query.query
    studentModel.find("$or": [
        {sname: new RegExp(query)}
        {sno: new RegExp(query)}
        {gender: new RegExp(query)}
        {class: new RegExp(query)}
        {department: new RegExp(query)}
    ],null, {sort:
            'sno': 1
        },
    (err, data)->
        if err?
            console.log(err)
        res.render 'student',
            students: data
            username: req.session.username
            query: query
            status: ''
    )

#   增加一个学生
router.post "/add", (req, res) ->
    unless req.session.username?
        res.redirect '/'
    _sno = req.body.sno
    _sname = req.body.sname
    _gender = req.body.gender
    _class = req.body.class
    _department = req.body.department
    _birthday = req.body.birthday
    studentEntity = new studentModel
        sno: _sno
        sname: _sname
        gender: _gender
        class: _class
        department: _department
        birthday: _birthday
    studentEntity.save((err)->
        if err?
            console.log(err)
    )
    res.redirect '/'

#   删除一个学生
router.get "/delete/:sid", (req, res) ->
    unless req.session.username?
        res.redirect '/'
    sid = req.params.sid
    console.log(sid)
    studentModel.remove(
        {_id: sid},
    (err)->
        if err?
            console.log(err)
    )
    res.redirect '/student'

#   修改一个学生
router.post "/update/:sid", (req, res) ->
    unless req.session.username?
        res.redirect '/'
    sid = req.params.sid
    _sno = req.body.sno
    _sname = req.body.sname
    _gender = req.body.gender
    _class = req.body.class
    _department = req.body.department
    _birthday = req.body.birthday
    studentModel.findByIdAndUpdate(sid,
        sno: _sno
        sname: _sname
        gender: _gender
        class: _class
        department: _department
        birthday: _birthday,
        (err)->
            if err?
                console.log(err)
    )
    res.redirect '/student'

module.exports = router