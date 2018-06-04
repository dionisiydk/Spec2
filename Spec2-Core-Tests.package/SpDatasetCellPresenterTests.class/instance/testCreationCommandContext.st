tests
testCreationCommandContext

	| context |
	context := presenter createCommandContext.
	
	self assert: (context class equals: SpDatasetContext).
	self assert: context tool equals: datasetPresenter.
	self assert: context selectedItems equals: {model}.
	