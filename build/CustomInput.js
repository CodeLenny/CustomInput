// Generated by CoffeeScript 1.8.0
(function() {
  define(["jquery", "CustomInput/Editor", "CustomInput/util/InputTypeList"], function($, Editor, InputTypeList) {
    var CustomInput;
    CustomInput = (function() {
      function CustomInput(checkPages, name, prefix) {
        if (checkPages == null) {
          checkPages = true;
        }
        if (name == null) {
          name = "CustomInput";
        }
        if (prefix == null) {
          prefix = "ci";
        }
        this.name = name;
        this.prefix = prefix;
        this.$ = $;
        this.jQuery = $;
        if (checkPages) {
          this.launch(window.location.pathname);
        }
      }

      CustomInput.prototype.isViewer = function(url) {
        return url.indexOf("viewform") > -1;
      };

      CustomInput.prototype.isEditor = function(url) {
        return url.indexOf("/edit") > -1;
      };

      CustomInput.prototype.launch = function(url) {
        if (this.isViewer(url)) {
          this.loadViewer();
        }
        if (this.isEditor(url)) {
          return this.loadEditor();
        }
      };

      CustomInput.prototype.addType = function(type) {
        if (this.extraInputTypes == null) {
          this.extraInputTypes = new InputTypeList();
        }
        return this.extraInputTypes.push(type);
      };

      CustomInput.prototype.loadViewer = function() {};

      CustomInput.prototype.loadEditor = function() {
        this.editor = new Editor(this);
        this.editor.appendToInsertMenu(this.extraInputTypes);
        this.editor.onFieldSelect((function(_this) {
          return function() {
            var field;
            field = _this.editor.getCurrentInputType();
            if (!field) {

            }
          };
        })(this));
        if (field.isCustom()) {
          field.replaceEditor(this.editor);
        }
        return this.editor.onQuestionTypeDropdown((function(_this) {
          return function(menu) {
            return _this.editor.appendToFieldTypeMenu(menu, _this.extraInputTypes);
          };
        })(this));
      };

      return CustomInput;

    })();
    return CustomInput;
  });

}).call(this);
