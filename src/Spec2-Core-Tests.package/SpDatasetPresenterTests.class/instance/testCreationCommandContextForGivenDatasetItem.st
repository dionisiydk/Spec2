tests
testCreationCommandContextForGivenDatasetItem

	| item context |
	item := model itemAt: 1.
	context := presenter createCommandContextFor: item.
	
	self assert: context class equals: SpDatasetContext.
	self assert: context tool equals: presenter.
	self assert: context selectedItems equals: {item}