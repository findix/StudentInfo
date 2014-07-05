express = require "express"
router = express.Router()

# GET home page. 
router.get "/", (req, res) ->
    if req.session.username?
        res.render 'index',
            username: req.session.username
    else res.render "login",
        status: ''

router.use "/index", (req, res) ->
    unless req.session.username?
        res.redirect '/'
    res.render 'index',
        username: req.session.username

module.exports = router