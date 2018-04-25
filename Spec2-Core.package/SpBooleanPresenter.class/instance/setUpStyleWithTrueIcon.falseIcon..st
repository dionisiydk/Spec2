styles-default
setUpStyleWithTrueIcon: trueIconName falseIcon: falseIconName
	"No there is no icon for readonly mode. So we simply do not handle clicks.
	Notice that in CheckboxMorph implement disable state directly in drawOn method. Owful"
	| iconName |
	model isReadOnly ifFalse: [	
		ui when: SpMouseClick on: view do: [ self toggleValue]].	
	
	iconName := model value ifTrue: [ trueIconName ] ifFalse: [ falseIconName ].
	ui layout: self with: [ :layout | 
		layout beFlow horizontal.
		layout add: (SpLabelPresenter iconic: iconName) with: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ]
	]