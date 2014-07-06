express = require "express"
mongoose = require 'mongoose'
router = express.Router()

gradeModel = mongoose.model "Grade"
courseModel = mongoose.model "Course"

router.get "/", (req, res)->
    unless req.session.username?
        res.redirect '/'
    res.redirect '/student'

router.get "/:sid", (req, res) ->
    unless req.session.username?
        res.redirect '/'
    sid = req.params.sid
    gradeModel.find({student: sid}, null, {sort:
            'course.cno': 1
        },
    (err, data)->
        if err?
            console.log(err)
        courseModel.find().exec((err, courses)->
            res.render 'grade',
                grades: data
                username: req.session.username
                status: ''
                sid: sid
                courses: courses
        )
    ).populate("course student")

#   增加成绩
router.post "/add", (req, res) ->
    unless req.session.username?
        res.redirect '/'
    _cno = req.body.cno
    _cname = req.body.cname
    _score = req.body.score
    _sid = req.body.sid
    courseModel.findOne(cno: _cno,(err, data) ->
            if err?
                console.log(err)
            gradeEntity = new gradeModel
                student: _sid
                course: data._id
                score: _score
            gradeEntity.save((err)->
                if err?
                    console.log(err)
            )
            res.redirect "/grade/#{_sid}"
    )

#   删除成绩
router.get "/delete/:gid/:sid", (req, res) ->
    unless req.session.username?
        res.redirect '/'
    gid = req.params.gid
    sid = req.params.sid
    console.log(gid)
    gradeModel.remove(
        {_id: gid},
    (err)->
        if err?
            console.log(err)
    )
    res.redirect "/grade/#{sid}"

#   修改成绩
router.post "/update/:gid", (req, res) ->
    unless req.session.username?
        res.redirect '/'
    gid = req.params.gid
    _cno = req.body.cno
    _cname = req.body.cname
    _score = req.body.score
    _sid = req.body.sid
    courseModel.findOne(cno: _cno,(err, data) ->
            if err?
                console.log(err)
            gradeModel.findByIdAndUpdate(gid,
                student: _sid
                course: data._id
                score: _score,
                (err)->
                    if err?
                        console.log(err)
            )
    )
    res.redirect "/grade/#{_sid}"

router.get "/average/:cid", (req, res)->
#    unless req.session.username?
#        res.redirect '/'
    cid = req.params.cid
    gradeModel.find(course: cid,(err, data) ->
            sum = 0
            sum += datum.score for datum in data
            res.send (sum / data.length)+''
    )

module.exports = router