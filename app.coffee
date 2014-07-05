express = require("express")
path = require("path")
favicon = require("serve-favicon")
logger = require("morgan")
cookieParser = require("cookie-parser")
bodyParser = require("body-parser")
session = require("express-session")
db = require("./config/database")
indexRoute = require("./routes/index")
userRoute = require("./routes/user")
testRoute = require "./routes/test"
studentRoute = require "./routes/student"
app = express()

# view engine setup
app.set "views", path.join(__dirname, "views")
app.set "view engine", "ejs"
app.use favicon(__dirname + "/public/favicon.ico")
app.use logger("dev")
app.use bodyParser()
app.use bodyParser.json()
app.use bodyParser.urlencoded(extended: true)
app.use cookieParser()
app.use(session(
    secret: '1234567890QWERTY'
    resave: 'true'
    saveUninitialized: "true"
))
app.use require("less-middleware")(path.join(__dirname, "public"))
app.use express.static(path.join(__dirname, "public"))
app.use "/", indexRoute
app.use "/user", userRoute
app.use "/test", testRoute
app.use "/student", studentRoute

#/ catch 404 and forward to error handler
app.use (req, res, next) ->
    err = new Error("Not Found")
    err.status = 404
    next err
    return


#/ error handlers

# development error handler
# will print stacktrace
if app.get("env") is "development"
    app.use (err, req, res, next) ->
        res.status err.status or 500
        res.render "error",
            message: err.message
            error: err
        return


# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render "error",
        message: err.message
        error: {}
    return

module.exports = app