define ["CustomInput/types/InputType"], (InputType) ->
	class MultipleChoiceInput extends InputType
		constructor: (args...) ->
			super args...
		custom: -> no
	return MultipleChoiceInput