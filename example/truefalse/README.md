# TrueFalse

TrueFalse is a simple example to show the usage of CustomInput by adding a simple True/False input type allowing the
user to select between the two.

The code is made to be used as a
[bookmarklet](https://github.com/CodeLenny/CustomInput/blob/master/example/truefalse/bookmarklet.coffee)
that loads a user inputted version if one isn't defined at the top.  This allows version upgradability by
just inputting a commit number or version tag.

The code loads the other files inside TrueFalse by configuring Require.js to serve files marked as part of `TrueFalse`
through a path declaration in 
[TrueFalse.coffee](https://github.com/CodeLenny/CustomInput/blob/master/example/truefalse/TrueFalse.coffee),
the main file loaded after TrueFalse is run.

Thanks to the main [Makefile](https://github.com/CodeLenny/CustomInput/blob/master/Makefile) in CustomInput,
CoffeeScript in TrueFalse is built into the
[build](https://github.com/CodeLenny/CustomInput/tree/master/build) directory,
inside it's [own folder](https://github.com/CodeLenny/CustomInput/tree/master/build/example/truefalse).

![Imgur](http://i.imgur.com/iybYA3i.png)
