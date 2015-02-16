# CustomInput for Google Forms
Custom form input types for Google Forms.

## Usage
CustomInput is written with [Require.js](http://requirejs.org/) to manage the source tree.

If your program is built with Require.js, you can simply add CustomInput as a dependency through `require()`.

If you aren't using Require.js, the standalone instructions go through adding Require.js and our standalone
loading script to your application.

### Standalone

	<script data-main="//cdn.rawgit.com/CodeLenny/CustomInput/[tag]/build/standalone.js" src="//cdn.rawgit.com/jrburke/requirejs/49086cf903410c746140fd968151a8aa95cc3482/require.js"></script>

If you replace `[tag]` with the version of CustomInput that you want, the above line will add Require.js to the global scope and our [standalone loader](https://github.com/CodeLenny/CustomInput/blob/master/src/standalone.coffee) to your project.  The standalone version uses a few variables that are defined at the top of the file.  You could create your own copy of the file and host it seperately if you wish, and then change the `data-main` property.

By default, the standalone loader adds CustomInput to the global scope and also checks if a callback has been defined.  You can then call CustomInput with the examples below.

#### CoffeeScript Standalone

```coffee
# Configure Require.js
requirejs.config
	baseUrl: "//cdn.rawgit.com/CodeLenny/CustomInput/[tag]/build"
	paths:
		CustomInput: "//cdn.rawgit.com/CodeLenny/CustomInput/[tag]/build"
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
  baseUrl: "//cdn.rawgit.com/CodeLenny/CustomInput/[tag]/build",
  paths: {
    CustomInput: "//cdn.rawgit.com/CodeLenny/CustomInput/[tag]/build"
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