define ["CustomInput/types/InputType"], (InputType) ->
	class GridInput extends InputType
		constructor: (args...) ->
			super args...
		custom: -> no
	return GridInput