// Generated by CoffeeScript 1.8.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["CustomInput/types/InputType"], function(InputType) {
    var CheckboxesInput;
    CheckboxesInput = (function(_super) {
      __extends(CheckboxesInput, _super);

      function CheckboxesInput() {
        CheckboxesInput.__super__.constructor.call(this);
      }

      CheckboxesInput.prototype.custom = function() {
        return false;
      };

      return CheckboxesInput;

    })(InputType);
    return CheckboxesInput;
  });

}).call(this);
