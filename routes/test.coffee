express = require "express"
router = express.Router()

router.get "/", (req, res) ->
    if req.session.username?
        res.render 'index',
            username: req.session.username
    else res.render "login",
        status: ''

module.exports = router