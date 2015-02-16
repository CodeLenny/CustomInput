define [
	"jquery",
	"CustomInput/types/InputType",
	"CustomInput/util/InputTypeList",
	"CustomInput/types/TextInput",
	"CustomInput/types/ParagraphInput",
	"CustomInput/types/MultipleChoiceInput",
	"CustomInput/types/CheckboxesInput",
	"CustomInput/types/ChooseInput",
	"CustomInput/types/ScaleInput",
	"CustomInput/types/GridInput",
	"CustomInput/types/DateInput",
	"CustomInput/types/TimeInput"
], ($, InputType, InputTypeList, TextInput, ParagraphInput, MultipleChoiceInput, CheckboxesInput, ChooseInput, ScaleInput, GridInput, DateInput, TimeInput) ->
	class Editor
		constructor: (ci) ->
			@main = ci # [CustomInput]
			@main.fontAwesomeAdded ?= no
			@currentField = null
		addFontAwesome: ->
			$("<link />").attr
				rel: "stylesheet"
				href: "//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
			@main.fontAwesomeAdded = yes
		# [InputTypeList] types
		appendToInsertMenu: (types) ->
			@addFontAwesome() if not @main.fontAwesomeAdded
			menu = $(".goog-menuheader.goog-menuheader-disabled:contains('Basic')").parent()
			# Remove old headers and items
			$("#{@main.prefix}insertMenu", menu).remove()
			$("[id^='\\:#{@main.prefix}insert']", menu).remove()
			# Add new header
			header = $("<div />").text(@main.name).addClass("goog-menuheader goog-menuheader-disabled").attr
				id: ":#{@main.prefix}insertMenu"
				"aria-disabled": "true"
				style: "-webkit-user-select: none;"
			menu.append(header)
			# Add items
			for typeObj, x in types
				type = new typeObj() # [InputType]
				item = $("<div />").addClass("goog-menuitem apps-menuitem").attr
					id: ":#{@main.prefix}insert#{x}"
					role: "menuitem"
					style: "-webkit-user-select: none;"
				container = $("<div />").addClass("google-menuitem-content").css("-webkit-user-select", "none")
				iconHolder = $("<div />").addClass("docs-icon goog-inline-block goog-menuitem-icon").css("-webkit-user-select", "none").attr
					"aria-hidden": true
				icon = $("<div />").addClass("docs-icon-img-container docs-icon-img fa fa-#{type.displayIcon()}").css("-webkit-user-select", "none")
				container.append iconHolder.append icon
				label = $("<span />").addClass("google-menuitem-label").css("-webkit-user-select", "none").text(type.displayName().substr(1)).attr
					"aria-label": type.displayName()
				letter = $("<span />").addClass("goog-menuitem-mnemonic-hint").css("-webkit-user-select", "none").text(type.displayName().substr(0,1))
				menu.append item.append container.append label.prepend letter
		onQuestionTypeDropdown: (cb) ->
			$("body").on "mousedown", ".ss-formwidget-container", ->
				dropdownHolder = $("[id$='fw_tdd']")
				currentMenuElement = dropdownHolder.attr("aria-activedescendant")
				menuElement = $("[id='" + currentMenuElement + "']")
				if menuElement.parents(".goog-menu").length > 0
					menu = menuElement.parent()
					cb menu
		appendToFieldTypeMenu: (menu, types) ->
			$("[id^=':#{@main.prefix}menuItem']", menu).remove()
			@addFontAwesome() if not @main.fontAwesomeAdded
			for typeObj, x in types
				type = new typeObj() # [InputType]
				item = $("<div />").addClass("goog-menuitem").css("-webkit-user-select", "none").attr
					id: ":#{@main.prefix}menuItem#{x}"
					role: "menuitem"
				text = $("<div />").addClass("goog-menuitem-content").css("-webkit-user-select", "none").text(type.displayName())
				menu.append item.append text
		onFieldSelect: (cb) ->
			$("body").on "mousedown", ".ss-formwidget-container", =>
				if not @currentField or @currentField isnt @getCurrentFieldPosition()
					@currentField = @getCurrentFieldPosition()
					cb()
		getCurrentFieldPosition: ->
			allFields = $(".ss-formwidget-container")
			current = @getCurrentField()
			allFields.index current
		getCurrentField: ->
			$(".ss-formwidget-container-editor")
		getCurrentInputType: ->
			el = @getCurrentField()
			name = $("[id$=':fw_tf]", el).val()
			description = $("[id$=':fw_htf]", el).val()
			Type = switch $(".ss-formwidget-container-editor [id$='fw_tdd'] .goog-flat-menu-button-caption").text()
				when "Text"
					TextInput
				when "Paragraph text"
					ParagraphInput
				when "Multiple Choice"
					MultipleChoiceInput
				when "Checkboxes"
					CheckboxesInput
				when "Choose from a list"
					ChooseInput
				when "Scale"
					ScaleInput
				when "Grid"
					GridInput
				when "Date"
					DateInput
				when "Time"
					TimeInput
			return if not Type
			type = new Type({name: name, description: description})
		#loadEditor: ->
			# @editor = new Editor()
			# @editor.appendToInsertMenu(@extraInputTypes)
			# @editor.onFieldSelect =>
			# 	field = @editor.getCurrentInputType()
			# 	field = @deserialize(field)
			#	field.showEditor() if field.isCustom()
			# @editor.onQuestionTypeDropdown ->
			# 	@editor.appendToFieldTypeMenu(@extraInputTypes)

	return Editor