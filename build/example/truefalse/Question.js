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
        return "Text";
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
        if (this.isIn(check.name, ["[True/False]", "[True False]", "[T/F]", "[t/f]"])) {
          return new Question(check);
        }
        return check;
      };

      Question.isIn = function(str, phrases) {
        var phrase, _i, _len;
        for (_i = 0, _len = phrases.length; _i < _len; _i++) {
          phrase = phrases[_i];
          if (str.indexOf(phrase) > -1) {
            return true;
          }
        }
        return false;
      };

      Question.prototype.replaceEditor = function(editor) {
        var checkboxDiv, pageBasedOnAnswer, preview;
        preview = $(".ss-formwidget-fieldpreview");
        preview.children().remove();
        pageBasedOnAnswer = $(".ss-formwidget-go-to-page-cb");
        pageBasedOnAnswer.parent().parent().hide();
        checkboxDiv = $("<div />");
        this.clarifyCheckbox = $("<input type='checkbox' />");
        this.clarifyCheckbox.change(this.clarify);
        checkboxDiv.append(this.clarifyCheckbox).append($("<span>Allow clarification</span>"));
        preview.append(checkboxDiv);
        return preview.append(this.createDisplay());
      };

      Question.prototype.allowClarify = function() {
        return this.getDescription().indexOf("[AllowClarify]") > -1;
      };

      Question.prototype.createDisplay = function() {
        var buttons, container, falseButton, main, toggle, trueButton;
        container = $("<div />");
        main = $("<div />");
        buttons = $("<span />");
        trueButton = $("<button>True</button>");
        falseButton = $("<button>False</button>");
        toggle = function(turnOn, turnOff) {
          turnOn.css({
            "background-color": "lightGrey",
            "padding-left": "5px",
            "padding-right": "5px"
          });
          return turnOff.css({
            "background-color": null,
            "padding-left": null,
            "padding-right": null
          });
        };
        trueButton.onclick = (function(_this) {
          return function() {
            toggle(trueButton, falseButton);
            return _this.button(true);
          };
        })(this);
        falseButton.onclick = (function(_this) {
          return function() {
            toggle(falseButton, trueButton);
            return _this.button(false);
          };
        })(this);
        buttons.append(trueButton).append(falseButton);
        this.questionSpan = $("<span />").text(this.name);
        main.append(buttons).append(this.questionSpan);
        this.clarify = $("<div />").append($("<input />").attr("placeholder", "Clarify").onkeyup(this.clarified));
        container.append(main).append(this.clarify);
        return container;
      };

      Question.prototype.button = function(val) {};

      Question.prototype.clarified = function() {
        var val;
        return val = this.clarify.children("input").val();
      };

      return Question;

    })(InputType);
    return Question;
  });

}).call(this);
