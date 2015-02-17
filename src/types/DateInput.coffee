define ["CustomInput/types/InputType"], (InputType) ->
	class DateInput extends InputType
		constructor: (args...) ->
			super args...
		custom: -> no
	return DateInput