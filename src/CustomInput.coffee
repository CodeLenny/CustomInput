define ["jquery", "CustomInput/Editor", "CustomInput/util/InputTypeList"], ($, Editor, InputTypeList) ->
	class CustomInput
		# [Boolean] checkPages - If yes, checks the current URL to determine if
		# the editor or viewer should be parsed and enhanced.
		constructor: (checkPages = yes, name = "CustomInput", prefix = "ci") ->
			@name = name
			@prefix = prefix
			@$ = $
			@jQuery = $
			if checkPages
				@launch window.location.pathname
		isViewer: (url) -> url.indexOf("viewform") > -1
		isEditor: (url) -> url.indexOf("/edit") > -1
		launch: (url) ->
			if @isViewer(url)
				@loadViewer()
			if @isEditor(url)
				@loadEditor()
		# [InputType] type
		addType: (type) ->
			@extraInputTypes ?= new InputTypeList()
			@extraInputTypes.push type
		loadViewer: ->
			# @viewer = new Viewer @
			# fields = @viewer.getFields()
			# for field in fields
			#	field = @deserialize(field)
			# 	field.replaceViewer viewer if field.custom()
		loadEditor: ->
			@editor = new Editor @
			@editor.appendToInsertMenu(@extraInputTypes)
			@editor.onFieldSelect =>
				field = @editor.getCurrentInputType()
				return if not field
				field = @deserialize(field)
				field.replaceEditor @editor if field.custom()
			@editor.onQuestionTypeDropdown (menu) =>
				@editor.appendToFieldTypeMenu menu, @extraInputTypes
		deserialize: (field) ->
			for type in @extraInputTypes
				field = type.customChecker field, type
			return field
	return CustomInput