// Generated by CoffeeScript 1.8.0
(function() {
  var version,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  version = "0.1";

  requirejs.config({
    baseUrl: baseUrl,
    paths: {
      CustomInput: "//cdn.rawgit.com/CodeLenny/CustomInput/" + version + "/build/",
      TrueFalse: "//cdn.rawgit.com/CodeLenny/CustomInput/" + version + "/build/example/truefalse/",
      requirejs: '//cdn.rawgit.com/jrburke/requirejs/49086cf903410c746140fd968151a8aa95cc3482/',
      jquery: "//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min"
    }
  });

  require(["CustomInput/CustomInput"], function(CustomInput) {
    var TrueFalse;
    return TrueFalse = (function(_super) {
      __extends(TrueFalse, _super);

      function TrueFalse() {
        TrueFalse.__super__.constructor.call(this, true);
      }

      return TrueFalse;

    })(CustomInput);
  });

}).call(this);
