define ["CustomInput/types/InputType"], (InputType) ->
	class ScaleInput extends InputType
		constructor: (args...) ->
			super args...
		custom: -> no
	return ScaleInput