define ->
	class InputType
		# Return the native type that this input is stored as.
		# @returns [String]
		getNativeType: -> ""
		# Can replace with a function to check if a standard input type should be
		# converted to custom type.  Return the origional type if it shouldn't be
		# changed, or a new instance of this type if it should.
		customEditorChecker: -> no
		customViewerChecker: -> no
		# If the input type is custom
		# @returns [Boolean]
		custom: -> yes
		# Custom inputs can define a function to replace the editor preview
		# with their own code.
		replaceEditor: -> no
		replaceViewer: -> no
	return InputType