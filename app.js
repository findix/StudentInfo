// Generated by CoffeeScript 1.7.1
(function() {
  var app, bodyParser, cookieParser, db, express, favicon, indexRoute, logger, path, session, studentRoute, testRoute, userRoute;

  express = require("express");

  path = require("path");

  favicon = require("serve-favicon");

  logger = require("morgan");

  cookieParser = require("cookie-parser");

  bodyParser = require("body-parser");

  session = require("express-session");

  db = require("./config/database");

  indexRoute = require("./routes/index");

  userRoute = require("./routes/user");

  testRoute = require("./routes/test");

  studentRoute = require("./routes/student");

  app = express();

  app.set("views", path.join(__dirname, "views"));

  app.set("view engine", "ejs");

  app.use(favicon(__dirname + "/public/favicon.ico"));

  app.use(logger("dev"));

  app.use(bodyParser());

  app.use(bodyParser.json());

  app.use(bodyParser.urlencoded({
    extended: true
  }));

  app.use(cookieParser());

  app.use(session({
    secret: '1234567890QWERTY',
    resave: 'true',
    saveUninitialized: "true"
  }));

  app.use(require("less-middleware")(path.join(__dirname, "public")));

  app.use(express["static"](path.join(__dirname, "public")));

  app.use("/", indexRoute);

  app.use("/user", userRoute);

  app.use("/test", testRoute);

  app.use("/student", studentRoute);

  app.use(function(req, res, next) {
    var err;
    err = new Error("Not Found");
    err.status = 404;
    next(err);
  });

  if (app.get("env") === "development") {
    app.use(function(err, req, res, next) {
      res.status(err.status || 500);
      res.render("error", {
        message: err.message,
        error: err
      });
    });
  }

  app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render("error", {
      message: err.message,
      error: {}
    });
  });

  module.exports = app;

}).call(this);

//# sourceMappingURL=app.map
