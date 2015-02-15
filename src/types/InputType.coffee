define ->
	class InputType
		constructor: (inherit) ->
			@name = if inherit and inherit.name then inherit.name else "" # [String]
			@description = if inherit and inherit.description then inherit.description else "" # [String]
		# Return the native type that this input is stored as.
		# @returns [String]
		getNativeType: -> ""
		# Can replace with a function to check if a standard input type should be
		# converted to custom type.  Return the origional type if it shouldn't be
		# changed, or a new instance of this type if it should.
		# @returns [InputType]
		# [InputType] check
		customEditorChecker: (check) -> check
		# @returns [InputType]
		# [InputType] check
		customViewerChecker: (check) -> check
		# If the input type is custom
		# @returns [Boolean]
		custom: -> yes
		# Custom inputs can define a function to replace the editor preview
		# with their own code.
		replaceEditor: -> no
		replaceViewer: -> no
	return InputType