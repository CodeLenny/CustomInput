define ["CustomInput/types/InputType"], (InputType) ->
	class CheckboxesInput extends InputType
		constructor: (args...) ->
			super args...
		custom: -> no
	return CheckboxesInput