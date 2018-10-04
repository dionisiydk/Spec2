tests
testToggleModelValueOnMouseClick

	| currentValue |
	currentValue := model value.
	
	ui simulate: SpMouseClick on: presenter view.
	self assert: model value equals: currentValue not.
	
	ui simulate: SpMouseClick on: presenter view.
	self assert: model value equals: currentValue.