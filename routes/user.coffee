express = require("express")
mongoose = require 'mongoose'
router = express.Router()

user = mongoose.model('User')

# GET login listing.
router.post '/Login', (req, res) ->
    username = req.body.username
    password = req.body.password
    user.find
        username: username
        password: password
    , (err, data) ->
        if data.length is 0
        then res.render 'login',
            status: '<div class="option_result">用户名或密码错误</div>'
        else
            req.session.username = username
            res.redirect "/"

router.get '/login', (req, res) ->
    res.redirect '/'

router.use '/logout', (req, res) ->
    req.session.username = null
    res.redirect '/'

router.get '/changepasswd', (req, res)->
    unless req.session.username?
        res.redirect '/'
    else res.render 'changePasswd',
        username: req.session.username
        status: ''

router.post '/Changepasswd', (req, res)->
    unless req.session.username?
        res.redirect '/'
    else
        username = req.session.username
        oldPassword = req.body.oldPassword
        password = req.body.password
        console.log username, oldPassword, password
        user.findOne
            username: username
            password: oldPassword
        , (err, data)->
            if not data?
            then res.render 'changePasswd',
                username: username
                status: '<div class="alert alert-danger">您输入的密码有错误</div>'
            else
                passwordRegex = new RegExp(/\w{6,16}/)
                if not passwordRegex.test(password)
                then res.render 'changePasswd',
                    username: username
                    status: '<div class="alert alert-danger">密码不规范，应为6~16位字母和数字！</div>'
                else data.password = password
                data.save()
                res.render 'changePasswd',
                    username: username
                    status: '<div class="alert alert-success">密码修改成功！</div>'
module.exports = router