// Generated by CoffeeScript 1.8.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["CustomInput/types/InputType"], function(InputType) {
    var DateInput;
    DateInput = (function(_super) {
      __extends(DateInput, _super);

      function DateInput() {
        DateInput.__super__.constructor.call(this);
      }

      DateInput.prototype.custom = function() {
        return false;
      };

      return DateInput;

    })(InputType);
    return DateInput;
  });

}).call(this);
