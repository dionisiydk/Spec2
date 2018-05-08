tests
testHasSingleDefaultColumnByDefault

	self assert: presenter columns size equals: 1.
	self assert: presenter columns first class equals: SpDefaultDatasetColumn 