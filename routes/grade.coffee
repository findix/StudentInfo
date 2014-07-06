express = require "express"
router = express.Router()

gradeModel = require "../model/Grade"

router.get "/:gid", (req, res) ->
    unless req.session.username?
        res.redirect '/'
    gid = req.params.gid
    query = req.query.query
    console.log(query)
    gradeModel.find({},null, {sort:
            'score': 1
        },
    (err, data)->
        if err?
            console.log(err)
        console.log(data)
        res.render 'grade',
            grades: data
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
    studentEntity = new gradeModel
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
    gradeModel.remove(
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
    gradeModel.findByIdAndUpdate(sid,
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