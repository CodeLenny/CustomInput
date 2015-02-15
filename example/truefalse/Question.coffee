define ["CustomInput/types/InputType"], (InputType) ->
	class Question extends InputType
		constructor: (inherit) ->
			super inherit
			@customViewerChecker = @customEditorChecker
		nativeType: -> "Scale"
		custom: -> yes
		name: -> "True False Question"
		icon: -> "fa-star-half"
		customEditorChecker: (check) ->
			if @isIn(@name, ["[True/False]", "[True False]", "[T/F]", "[t/f]"])
				return new Question(check)
			return check
		# Check if a series of phrases is in a test string.
		# [String] str, [Array]<String> phrases
		isIn: (str, phrases) ->
			for phrase in phrases
				return yes if str.indexOf(phrases) > -1
			return no
	return Question