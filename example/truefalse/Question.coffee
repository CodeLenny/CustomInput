define ["CustomInput/types/InputType"], (InputType) ->
	class Question extends InputType
		constructor: (inherit) ->
			super inherit
		nativeType: -> "Text"
		custom: -> yes
		displayName: -> "True False Question"
		displayIcon: -> "star-half"
		@customChecker: (check, Question) ->
			if @isIn(check.name, ["[True/False]", "[True False]", "[T/F]", "[t/f]"])
				return new Question(check)
			return check
		# Check if a series of phrases is in a test string.
		# [String] str, [Array]<String> phrases
		@isIn: (str, phrases) ->
			for phrase in phrases
				return yes if str.indexOf(phrase) > -1
			return no
		replaceEditor: (editor) ->
			preview = $(".ss-formwidget-fieldpreview")
			preview.children().remove()
			pageBasedOnAnswer = $(".ss-formwidget-go-to-page-cb")
			pageBasedOnAnswer.parent().parent().hide()
			checkboxDiv = $("<div />")
			@clarifyCheckbox = $("<input type='checkbox' />")
			@clarifyCheckbox.onchange @clarify
			checkboxDiv.append(@clarifyCheckbox).append($("<span>Allow clarification</span>"))
			preview.append(checkboxDiv)
			preview.append @createDisplay()
		allowClarify: ->
			@getDescription().indexOf("[AllowClarify]") > -1
		createDisplay: ->
			container = $("<div />")
			main = $("<div />")
			buttons = $("<span />")
			trueButton = $("<button>True</button>")
			falseButton = $("<button>False</button>")
			toggle = (turnOn, turnOff) ->
				turnOn.css
					"background-color": "lightGrey"
					"padding-left": "5px"
					"padding-right": "5px"
				turnOff.css
					"background-color": null
					"padding-left": null
					"padding-right": null
			trueButton.onclick = => toggle trueButton, falseButton; @button true
			falseButton.onclick = => toggle falseButton, trueButton; @button false
			buttons.append(trueButton).append(falseButton)
			@questionSpan = $("<span />").text(@name)
			main.append(buttons).append(@questionSpan)
			@clarify = $("<div />").append($("<input />").attr("placeholder", "Clarify").onkeyup(@clarified))
			container.append(main).append(@clarify)
			return container
		button: (val) ->
		clarified: ->
			val = @clarify.children("input").val()
	return Question