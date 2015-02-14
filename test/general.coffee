Browser = require "zombie"
expect = require("chai").expect

addStandalone = (host) ->
	describe "add standalone script to #{host}", ->
		it "is triggered"
		it "is loaded"

initialize = ->
	describe "initialize CustomInput", ->
		it "is initialized"

describe "load Google Forms editor", ->
	it "loaded properly"
	it "has elements"
	addStandalone("editor")
	initialize()
	describe "check location differentiators", ->
		it "identifies the editor"
		it "(correctly) doesn't identify viewer"

describe "load Google Forms viewer", ->
	it "loaded properly"
	it "has elements"
	addStandalone("viewer")
	initialize()
	describe "check location differentiators", ->
		it "identifies the viewer"
		it "(correctly) doesn't identify editor"