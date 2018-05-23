tests
testGettingGlobalIndex

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 2).
	
	self assert: item globalIndex equals: 2