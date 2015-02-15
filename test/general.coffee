Browser = require "zombie"
expect = require("chai").expect

login = require "./googleLogin.json"

addStandalone = (host, browser) ->
	scripts = browser.window.document.querySelectorAll("script").length
	injectedScript = browser.document.createElement("script");
	injectedScript.setAttribute("type","text/javascript");
	injectedScript.setAttribute("src", "//cdn.rawgit.com/jrburke/requirejs/49086cf903410c746140fd968151a8aa95cc3482/require.js")
	browser.body.appendChild(injectedScript);    
	browser.wait (window) ->
		window.document.querySelectorAll("script").length > scripts
	, ->

initialize = (host) ->
	describe "initialize CustomInput in #{host}", ->
		it "is initialized"

googleLogin = (host, browser, cb) ->
	oldPath = browser.location.pathname
	browser.fill("Email", login.email).fill("Password", login.password)
	check = ->
		console.log browser.location.pathname
		expect(browser.location.pathname).to.not.be.equal(oldPath)
	browser.pressButton("Sign in").then(check)

describe "Google Forms editor", ->
	before (done) ->
		Browser.visit login.form, (e, browser) ->
			describe "Login to Google Forms", ->
				it "loaded properly", ->
					expect(browser.success).to.be.ok
					expect(browser).to.be.ok
					expect(browser.statusCode).to.be.equal(200)
				it "has elements", ->
					expect(browser.queryAll('input')).to.have.length.of.at.least(2)
				it "logs in", ->
					googleLogin("editor", browser)
					browser.wait (window) ->
						browser.location.pathname.indexOf('/edit') > -1
					, done
	it "adds standalone", ->
		addStandalone "editor", this.browser
	initialize("editor")
	describe "check location differentiators", ->
		it "identifies the editor"
		it "(correctly) doesn't identify viewer"

describe "load Google Forms viewer", ->
	it "loaded properly"
	it "has elements"
	#addStandalone("viewer")
	initialize("viewer")
	describe "check location differentiators", ->
		it "identifies the viewer"
		it "(correctly) doesn't identify editor"