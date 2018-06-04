tests
testCreationCommandContextWhenManualSelectionIsNotAdded

	| context |
	context := presenter createCommandContext.
	
	self assert: context class equals: SpDatasetContext.
	self assert: context tool equals: presenter.
	self assert: context selectedItems isEmpty.
	