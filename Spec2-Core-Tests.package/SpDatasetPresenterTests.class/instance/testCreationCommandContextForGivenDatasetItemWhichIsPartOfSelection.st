tests
testCreationCommandContextForGivenDatasetItemWhichIsPartOfSelection

	| item context selection |
	selection := presenter addSelection: SpManualSelection new.
	selection selectItemsAt: #(1 3).
	item := model itemAt: 1.
	context := presenter createCommandContextFor: item.
	
	self assert: context class equals: SpDatasetContext.
	self assert: context tool equals: presenter.
	self 
		assert: (context selectedItems collect: #actualItem) 
		equals: {(model itemAt: 3) actualItem. item actualItem}