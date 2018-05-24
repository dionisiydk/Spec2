styles-button
setUpButtonStyle
	<styleSpec>
	<forStyle: #button>
	view borderColor: ui theme darkBaseColor.
	view borderWidth: 1.
	view color: ui theme lightBaseColor.
	
	ui when: SpMouseDown on: view do: [ self applyStyle: #pressedButton ].
	ui when: SpMouseUp on: view do: [ self resetStyle ].
	ui when: SpMouseLeave on: view do: [ currentStyle = #pressedButton ifTrue: [self resetStyle] ].
	
	ui layout: self with: [ :layout |
		layout beFlow horizontal; alignCenter.
		layout padding: 3@2.
		
		model menuItemIcon ifNotNil: [ :icon | 
			layout add: (SpImagePresenter on: icon) with: [ :c | 
				c fitContent; margin: 2@2 ]].
		layout add: (SpLabelPresenter textual: model menuItemName) with: [ :c | 
			c fitContent; margin: 2@2 ] ]