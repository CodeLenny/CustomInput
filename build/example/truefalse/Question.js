// Generated by CoffeeScript 1.8.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["CustomInput/types/InputType"], function(InputType) {
    var Question;
    Question = (function(_super) {
      __extends(Question, _super);

      function Question(inherit) {
        Question.__super__.constructor.call(this, inherit);
      }

      Question.prototype.nativeType = function() {
        return "Scale";
      };

      Question.prototype.custom = function() {
        return true;
      };

      Question.prototype.displayName = function() {
        return "True False Question";
      };

      Question.prototype.displayIcon = function() {
        return "star-half";
      };

      Question.customChecker = function(check, Question) {
        if (this.isIn(this.name, ["[True/False]", "[True False]", "[T/F]", "[t/f]"])) {
          return new Question(check);
        }
        return check;
      };

      Question.isIn = function(str, phrases) {
        var phrase, _i, _len;
        for (_i = 0, _len = phrases.length; _i < _len; _i++) {
          phrase = phrases[_i];
          if (str.indexOf(phrases) > -1) {
            return true;
          }
        }
        return false;
      };

      return Question;

    })(InputType);
    return Question;
  });

}).call(this);
