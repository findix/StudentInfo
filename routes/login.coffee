express = require("express")
router = express.Router()

user = require "../model/User"

# GET login listing.
router.post "/", (req, res) ->
    username = req.body.username
    password = req.body.password
    user.find
        username: username
        password: password
    , (err, user) ->
        if user.length is 0
        then res.render 'index',{status:'<div class="option_result">用户名或密码错误</div>'}
        else res.json
            status: 'success'

module.exports = router