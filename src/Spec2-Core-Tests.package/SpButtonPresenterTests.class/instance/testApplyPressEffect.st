tests
testApplyPressEffect

	ui simulate: SpMouseDown on: presenter view.
	self assert: presenter currentStyle equals: #pressedButton.
	
	ui simulate: SpMouseUp on: presenter view.
	self assert: presenter currentStyle equals: #button.