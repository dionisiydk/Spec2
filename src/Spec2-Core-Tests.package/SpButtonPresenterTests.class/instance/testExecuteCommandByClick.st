tests
testExecuteCommandByClick

	ui simulate: SpMouseClick on: presenter view.
	
	self assert: commandWasExecuted 