// Generated by CoffeeScript 1.8.0
(function() {
  var exampleVersion, inputVersion,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  inputVersion = "e28dd88";

  exampleVersion = "6e6ace7";

  requirejs.config({
    baseUrl: "//cdn.rawgit.com/CodeLenny/CustomInput/" + inputVersion + "/build",
    paths: {
      CustomInput: "//cdn.rawgit.com/CodeLenny/CustomInput/" + inputVersion + "/build",
      TrueFalse: "//cdn.rawgit.com/CodeLenny/CustomInput/" + exampleVersion + "/build/example/truefalse",
      requirejs: '//cdn.rawgit.com/jrburke/requirejs/49086cf903410c746140fd968151a8aa95cc3482',
      jquery: "//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min"
    }
  });

  require(["CustomInput/CustomInput", "TrueFalse/Question"], function(CustomInput, Question) {
    var TrueFalse;
    TrueFalse = (function(_super) {
      __extends(TrueFalse, _super);

      function TrueFalse() {
        this.addType(Question);
        TrueFalse.__super__.constructor.call(this, true, "True False", "tf");
      }

      return TrueFalse;

    })(CustomInput);
    return window.truefalse = new TrueFalse();
  });

}).call(this);
