define ["CustomInput/types/InputType"], (InputType) ->
	class TimeInput extends InputType
		constructor: (args...) ->
			super args...
		custom: -> no
	return TimeInput