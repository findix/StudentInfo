// Generated by CoffeeScript 1.7.1
(function() {
  var express, router;

  express = require("express");

  router = express.Router();

  router.get("/", function(req, res) {
    if (req.session.username != null) {
      return res.render('index', {
        username: req.session.username
      });
    } else {
      return res.render("login", {
        status: ''
      });
    }
  });

  module.exports = router;

}).call(this);

//# sourceMappingURL=test.map
