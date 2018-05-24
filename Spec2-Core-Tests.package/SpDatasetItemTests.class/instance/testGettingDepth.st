tests
testGettingDepth

	| item dataset |
	dataset := SpDataset new.
	dataset depth: 100.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 2).	
	item dataSourceItem depth: 10.
	
	self assert: item depth equals: 110