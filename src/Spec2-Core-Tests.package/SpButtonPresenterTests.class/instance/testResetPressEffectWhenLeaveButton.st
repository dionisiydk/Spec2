tests
testResetPressEffectWhenLeaveButton

	ui simulate: SpMouseDown on: presenter view.
	self assert: presenter currentStyle equals: #pressedButton.
	
	ui simulate: SpMouseLeave on: presenter view.
	self assert: presenter currentStyle equals: #button