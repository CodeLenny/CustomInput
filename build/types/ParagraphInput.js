// Generated by CoffeeScript 1.8.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(["CustomInput/types/InputType"], function(InputType) {
    var ParagraphInput;
    ParagraphInput = (function(_super) {
      __extends(ParagraphInput, _super);

      function ParagraphInput() {
        ParagraphInput.__super__.constructor.call(this);
      }

      ParagraphInput.prototype.custom = function() {
        return false;
      };

      return ParagraphInput;

    })(InputType);
    return ParagraphInput;
  });

}).call(this);