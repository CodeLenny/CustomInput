Browser = require "zombie"
expect = require("chai").expect

login = require "./googleLogin.json"

addStandalone = (host) ->
	describe "add standalone script to #{host}", ->
		it "is triggered"
		it "is loaded"

initialize = ->
	describe "initialize CustomInput", ->
		it "is initialized"

describe "Google Forms editor", ->
	before (done) ->
		this.browser = new Browser()
		this.browser.visit(login.form).then(done, done)
	it "loaded properly", ->
		expect(this.browser.success).to.be.ok
		expect(this.browser).to.be.ok
		expect(this.browser.statusCode).to.be.equal(200)
	it "has elements", ->
		expect(this.browser.queryAll('input')).to.have.length.of.at.least(2)
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