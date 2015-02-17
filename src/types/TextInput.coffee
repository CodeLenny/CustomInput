define ["CustomInput/types/InputType"], (InputType) ->
	class TextInput extends InputType
		constructor: (args...) ->
			super args...
		custom: -> no
	return TextInput