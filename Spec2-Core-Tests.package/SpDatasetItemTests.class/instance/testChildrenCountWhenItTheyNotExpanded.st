tests
testChildrenCountWhenItTheyNotExpanded

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualitem named: 'some item').
	item dataSourceItem defaultChildren: #(1 2 3).
	
	self assert: item childrenCount equals: 0