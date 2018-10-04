tests
testCreationCommandContextWhenCustomItemContextIsSpecified

	| item context |
	presenter itemContextClass: SpDatasetContextExample.
	
	item := model itemAt: 1.
	context := presenter createCommandContextFor: item.
	
	self assert: context class equals: SpDatasetContextExample.
	self assert: context tool equals: presenter.
	self assert: context selectedItems equals: {item}