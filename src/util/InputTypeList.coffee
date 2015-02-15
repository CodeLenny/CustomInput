define ->
	class InputTypeList extends Array
		# @return [InputType]
		get: (index) ->
			return @[index]
	return InputTypeList