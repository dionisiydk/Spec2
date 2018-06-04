tests
testCreationCommandContextWhenThereIsManualSelection

	| context selection |
	selection := presenter addSelection: SpManualSelection new.
	selection selectItemsAt: #(1 3).
	context := presenter createCommandContext.
	
	self assert: context class equals: SpDatasetContext.
	self assert: context tool equals: presenter.
	self deny: context selectedItems isEmpty.
	self assert: context selectedItems equals: selection items