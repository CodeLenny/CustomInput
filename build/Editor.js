// Generated by CoffeeScript 1.8.0
(function() {
  define(["jquery", "CustomInput/types/InputType", "CustomInput/util/InputTypeList"], function($, InputType, InputTypeList) {
    var Editor;
    Editor = (function() {
      function Editor(ci) {
        var _base;
        this.main = ci;
        if ((_base = this.main).fontAwesomeAdded == null) {
          _base.fontAwesomeAdded = false;
        }
      }

      Editor.prototype.appendToInsertMenu = function(types) {
        var container, header, icon, iconHolder, item, label, letter, menu, type, x, _i, _ref, _results;
        if (!this.main.fontAwesomeAdded) {
          this.addFontAwesome();
        }
        menu = $("#\\:8q").parent();
        header = $("<div />").text(this.main.name).addClass("goog-menuheader goog-menuheader-disabled").attr({
          id: ":" + this.main.prefix + "insertMenu",
          "aria-disabled": "true",
          style: "-webkit-user-select: none;"
        });
        menu.append(header);
        _results = [];
        for (x = _i = 0, _ref = types.length - 1; 0 <= _ref ? _i < _ref : _i > _ref; x = 0 <= _ref ? ++_i : --_i) {
          type = new types[x]();
          item = $("<div />").addClass("goog-menuitem apps-menuitem").attr({
            id: ":" + this.main.prefix + "insert" + x,
            role: "menuitem",
            style: "-webkit-user-select: none;"
          });
          container = $("<div />").addClass("google-menuitem-content").css("-webkit-user-select", "none");
          iconHolder = $("<div />").addClass("docs-icon goog-inline-block goog-menuitem-icon").css("-webkit-user-select", "none").attr({
            "aria-hidden": true
          });
          icon = $("<div />").addClass("docs-icon-img-container docs-icon-img fa fa-" + (type.icon())).css("-webkit-user-select", "none");
          container.append(iconHolder.append(icon));
          label = $("<span />").addClass("google-menuitem-label").css("-webkit-user-select", "none").text(item.displayName().substr(1)).attr({
            "aria-label": item.displayName()
          });
          letter = $("<span />").addClass("goog-menuitem-mnemonic-hint").css("-webkit-user-select", "none").text(item.displayName.substr(0, 1));
          _results.push(menu.append(item.append(container.append(label.prepend(letter)))));
        }
        return _results;
      };

      Editor.prototype.addFontAwesome = function() {
        $("<link />").attr({
          rel: "stylesheet",
          href: "//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
        });
        return this.main.fontAwesomeAdded = true;
      };

      return Editor;

    })();
    return Editor;
  });

}).call(this);
