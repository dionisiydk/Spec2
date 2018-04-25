styles-default
setUpCheckboxStyle
	<styleSpec>
	<forStyle: #checkbox>
	| iconName |
	ui when: SpMouseClick on: view do: [ self toggleValue].
	
	iconName := model value ifTrue: [ #checkboxSelected ] ifFalse: [ #checkboxUnselected ].
	ui layout: self with: [ :layout | 
		layout add: (SpLabelPresenter iconic: iconName) with: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ]
	]