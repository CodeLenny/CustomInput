define ["CustomInput/types/InputType"], (InputType) ->
	class ChooseInput extends InputType
		constructor: (args...) ->
			super args...
		custom: -> no
	return ChooseInput