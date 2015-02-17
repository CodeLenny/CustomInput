define ["CustomInput/types/InputType"], (InputType) ->
	class ParagraphInput extends InputType
		constructor: (args...) ->
			super args...
		custom: -> no
	return ParagraphInput