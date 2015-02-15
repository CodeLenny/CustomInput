define ->
	class CustomInput
		# [Boolean] checkPages - If yes, checks the current URL to determine if
		# the editor or viewer should be parsed and enhanced.
		constructor: (checkPages = yes) ->
			if checkPages
				@launch window.location.pathname
		@isViewer: (url) -> url.indexOf("viewform") > -1
		@isEditor: (url) -> url.indexOf("/edit") > -1
		launch: (url) ->
			if @isViewer(url)
				@loadViewer()
			if @isEditor(url)
				@loadEditor()
		loadViewer: ->
			# @viewer = new Viewer()
			# fields = @viewer.getFields()
			# for field in fields
			#	field.getNativeType()
			#	field = @deserialize(field)
			# 	field.showViewer() if field.isCustom
		loadEditor: ->
			# @editor = new Editor()
			# @editor.appendToInsertMenu(@extraInputTypes)
			# @editor.onFieldSelect =>
			# 	field = @editor.getCurrentField()
			# 	field.getNativeType()
			# 	field = @deserialize(field)
			#	field.showEditor() if field.isCustom
			# 	@editor.appendToFieldTypeMenu(@extraInputTypes)
	return CustomInput