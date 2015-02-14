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

	class MyCode
		constructor: ->
			@doStuff(window.CustomInput) if window.CustomInput
			window.onCustomInput = @doStuff if not window.CustomInput
		doStuff: (CustomInput) =>
			@inputManager = new CustomInput()

#### JavaScript Standalone

	function load(CustomInput) {
		var manager = new CustomInput();
	}
	if(!window.CustomInput) {
		window.onCustomInput = load;
	}
	else {
		load(window.CustomInput);
	}

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