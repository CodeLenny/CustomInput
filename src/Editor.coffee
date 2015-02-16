define ["jquery", "CustomInput/types/InputType", "CustomInput/util/InputTypeList"], ($, InputType, InputTypeList) ->
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
			$("#\\:8q #{@main.prefix}insertMenu").remove()
			$("#\\:8q [id^='\\:#{@main.prefix}insert']").remove()
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
		#loadEditor: ->
			# @editor = new Editor()
			# @editor.appendToInsertMenu(@extraInputTypes)
			# @editor.onFieldSelect =>
			# 	field = @editor.getCurrentField()
			# 	field = @deserialize(field)
			#	field.showEditor() if field.isCustom()
			# @editor.onQuestionTypeDropdown ->
			# 	@editor.appendToFieldTypeMenu(@extraInputTypes)

	return Editor