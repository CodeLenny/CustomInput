# CustomInput for Google Forms
Custom form input types for Google Forms.

Extend CustomInput using JavaScript or CoffeeScript to add your own field types that are added to the editor in Google Forms
and then processed when users go to view the form, allowing the display to be automatically replaced with your own code.

The resulting code can be compiled together into a simple bookmarklet, [TamperMonkey](http://tampermonkey.net/)/[GreaseMonkey](http://www.greasespot.net/) script, or a browser [extension](https://developer.chrome.com/extensions) for both form editors and viewers to use.

By extending the form interface and adding code to run for both the editor and the viewer, many unpleasant methods are avoided, like having to input raw LaTeX and having the result be inserted into the form as an [oddly-placed image](https://chrome.google.com/webstore/detail/gmath-for-forms/pfpepkdookmfefmppcknaobckehpjgcj?hl=en-US).

This could be used to add a LaTeX editor, an embedded code editor, or let the user input their location using [Google Maps](http://logicify.github.io/jquery-locationpicker-plugin/).

## Usage
CustomInput is written with [Require.js](http://requirejs.org/) to manage the source tree.

If your program is built with Require.js, you can simply add CustomInput as a dependency through `require()`.

If you aren't using Require.js, the standalone instructions go through adding Require.js and our standalone
loading script to your application.

See the [example directory](https://github.com/CodeLenny/CustomInput/tree/master/example) to see working programs using CustomInput.

### Standalone

	<script data-main="//cdn.rawgit.com/CodeLenny/CustomInput/[tag]/build/standalone.js" src="//cdn.rawgit.com/jrburke/requirejs/49086cf903410c746140fd968151a8aa95cc3482/require.js"></script>

If you replace `[tag]` with the version of CustomInput that you want, the above line will add Require.js to the global scope and our [standalone loader](https://github.com/CodeLenny/CustomInput/blob/master/src/standalone.coffee) to your project.  The standalone version uses a few variables that are defined at the top of the file.  You could create your own copy of the file and host it seperately if you wish, and then change the `data-main` property.

By default, the standalone loader adds CustomInput to the global scope and also checks if a callback has been defined.  You can then call CustomInput with the examples below.

#### CoffeeScript Standalone

```coffee
# Configure Require.js
requirejs.config
	baseUrl: "//cdn.rawgit.com/CodeLenny/CustomInput/0.1.0/build"
	paths:
		CustomInput: "//cdn.rawgit.com/CodeLenny/CustomInput/0.1.0/build"
# Include the code
require ["CustomInput/CustomInput", "CustomInput/types/InputType"], (CustomInput, InputType) ->
	# Define our new input type
	class LocationInput extends InputType
		displayName: -> "Google Maps Location"
	# Use the library, and load our input type
	inputManager = new CustomInput yes, "Google Maps", "gmaps"
	inputManager.add LocationInput
```

#### JavaScript Standalone

Please note that the following JavaScript has been written by someone more familiar with CoffeeScript's object orientation than in JavaScript, and the following is untested code.

```js
// CoffeeScript object-oriented library.  Feel free to replace with your own method of object orientation.
var __hasProp = {}.hasOwnProperty;
var __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };
// Configure Require.js
requirejs.config({
  baseUrl: "//cdn.rawgit.com/CodeLenny/CustomInput/0.1.0/build",
  paths: {
    CustomInput: "//cdn.rawgit.com/CodeLenny/CustomInput/0.1.0/build"
  }
});
// Include the code
require(["CustomInput/CustomInput", "CustomInput/types/InputType"], function(CustomInput, InputType) {
	// Define our new input type
	var LocationInput = (function(_super) {
		__extends(LocationInput, _super);
		function LocationInput() {
			Question.__super__.constructor.call(this, inherit);
		}
		Question.prototype.displayName = function() {
			return "Google Maps Location";
		};
		return LocationInput;
	})(InputType);
	// Use the library, and load our input type
	var inputManager = new CustomInput(yes, "Google Maps", "gmaps");
	inputManager.add(LocationInput);
});
```

## Status
See the [CHANGELOG](https://github.com/CodeLenny/CustomInput/blob/master/CHANGELOG.md) for full information.

### Implementation status

- [ ] Native input types
  - [x] Define types, global properties
  - [ ] Add getter/setter functions for the individual types
- [ ] Manager/overall code
  - [x] Require.js structure
  - [x] Constructor
  - [x] Page detection (by URL)
  - [x] Adding types
  - [ ] Adding custom fields
  - [x] Parse editor structure
  - [ ] Parse viewer structure
    - [x] Outline framework
    - [ ] Finalize and debug
- [ ] Editor Integration
  - [ ] Insert menu
    - [x] List types
    - [ ] Add icons (not priority)
    - [ ] Trigger on click
  - [ ] Question type dropdown
    - [x] List types
    - [ ] Trigger on click
  - [ ] Add Item dropdown (not priority)
    - [ ] List types
    - [ ] Trigger on click
  - [ ] Custom fields
- [ ] Viewer Integration
  - [ ] Locate items
  - [ ] Detect native types
  - [ ] Add binding to replace interface for custom types
  - [ ] Manage custom fields (not priority)
  - [ ] Manage save and submit
- [ ] Results (Google Sheet of Responses)
  - [ ] Add triggers
  - [ ] Search field types
  - [ ] Add hook for custom display functions

### Implementation of example ([TrueFalse](https://github.com/CodeLenny/CustomInput/tree/master/example/truefalse))

#### True/False Question Type

- [ ] Editor
  - [x] Define item name and icon to add to menus
  - [ ] Write code to trigger when item added
  - [ ] Write code to trigger when converting item type (when question type dropdown is changed inside the item editor)
  - [ ] Write editor interface (define fields, disabled preview of interface)
- [ ] Viewer
  - [ ] Viewer interface
- [ ] Results
  - [ ] Add basic effect for the results

#### Extra Field

- [ ] Construction (add to CustomInput manger)
- [ ] Editor apperance/bound functions
- [ ] Viewer bound function
- [ ] Results function (if needed)


## License
Copyright 2015 Ryan Leonard.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program, called "LICENSE".  If not, see <http://www.gnu.org/licenses/>.