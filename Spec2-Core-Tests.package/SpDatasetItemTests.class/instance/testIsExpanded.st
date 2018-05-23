tests
testIsExpanded

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	
	self deny: item isExpanded.
	item dataSourceItem defaultChildren: #(1 2 3).
	self deny: item isExpanded.
	
	item expand.
	self assert: item isExpanded