// Generated by CoffeeScript 1.8.0
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __slice = [].slice;

  define(["CustomInput/types/InputType"], function(InputType) {
    var GridInput;
    GridInput = (function(_super) {
      __extends(GridInput, _super);

      function GridInput() {
        var args;
        args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        GridInput.__super__.constructor.apply(this, args);
      }

      GridInput.prototype.custom = function() {
        return false;
      };

      return GridInput;

    })(InputType);
    return GridInput;
  });

}).call(this);
