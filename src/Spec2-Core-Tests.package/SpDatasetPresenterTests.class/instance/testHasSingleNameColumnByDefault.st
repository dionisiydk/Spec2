tests
testHasSingleNameColumnByDefault

	self assert: presenter columns size equals: 1.
	self assert: presenter columns first class equals: SpItemNameColumn.
	self assert: presenter columns first datasetPresenter equals: presenter