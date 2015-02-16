define ["jquery", "CustomInput/types/InputType", "CustomInput/util/InputTypeList"], ($, InputType, InputTypeList) ->
	class Editor
		constructor: (ci) ->
			@main = ci # [CustomInput]
			@main.fontAwesomeAdded ?= no
		# [InputTypeList] types
		appendToInsertMenu: (types) ->
			@addFontAwesome() if not @main.fontAwesomeAdded
			menu = $("#\\:8q").parent()
			header = $("<div />").text(@main.name).addClass("goog-menuheader goog-menuheader-disabled").attr
				id: ":#{@main.prefix}insertMenu"
				"aria-disabled": "true"
				style: "-webkit-user-select: none;"
			menu.append(header)
			for x in [0...types.length]
				type = types.get(x) # [InputType]
				item = $("<div />").addClass("goog-menuitem apps-menuitem").attr
					id: ":#{@main.prefix}insert#{x}"
					role: "menuitem"
					style: "-webkit-user-select: none;"
				container = $("<div />").addClass("google-menuitem-content").css("-webkit-user-select", "none")
				iconHolder = $("<div />").addClass("docs-icon goog-inline-block goog-menuitem-icon").css("-webkit-user-select", "none").attr
					"aria-hidden": true
				icon = $("<div />").addClass("docs-icon-img-container docs-icon-img fa fa-#{type.icon()}").css("-webkit-user-select", "none")
				container.append iconHolder.append icon
				label = $("<span />").addClass("google-menuitem-label").css("-webkit-user-select", "none").text(item.name().substr(1)).attr
					"aria-label": item.name()
				letter = $("<span />").addClass("goog-menuitem-mnemonic-hint").css("-webkit-user-select", "none").text(item.name.substr(0,1))
				menu.append item.append container.append label.prepend letter
		addFontAwesome: ->
			$("<link />").attr
				rel: "stylesheet"
				href: "//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
			@main.fontAwesomeAdded = yes
		#loadEditor: ->
			# @editor = new Editor()
			# @editor.appendToInsertMenu(@extraInputTypes)
			# @editor.onFieldSelect =>
			# 	field = @editor.getCurrentField()
			# 	field = @deserialize(field)
			#	field.showEditor() if field.isCustom()
			# 	@editor.appendToFieldTypeMenu(@extraInputTypes)
	return Editor