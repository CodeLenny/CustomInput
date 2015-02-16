define ["CustomInput/types/InputType"], (InputType) ->
	class Question extends InputType
		constructor: (inherit) ->
			super inherit
		nativeType: -> "Scale"
		custom: -> yes
		displayName: -> "True False Question"
		displayIcon: -> "star-half"
		@customChecker: (check) ->
			if @isIn(@name, ["[True/False]", "[True False]", "[T/F]", "[t/f]"])
				return new Question(check)
			return check
		# Check if a series of phrases is in a test string.
		# [String] str, [Array]<String> phrases
		@isIn: (str, phrases) ->
			for phrase in phrases
				return yes if str.indexOf(phrases) > -1
			return no
	return Question