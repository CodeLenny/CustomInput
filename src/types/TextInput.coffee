define ["CustomInput/types/InputType"], (InputType) ->
	class TextInput extends InputType
		constructor: ->
			super()
		custom: -> no
	return TextInput