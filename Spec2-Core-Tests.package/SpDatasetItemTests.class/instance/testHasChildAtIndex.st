tests
testHasChildAtIndex

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 10).
	item dataSourceItem defaultChildren: #(1 2 3).
	item expand.
		
	self deny: (item hasChildAt: 2).
	self deny: (item hasChildAt: 10).
	self assert: (item hasChildAt: 11).
	self assert: (item hasChildAt: 13).
	self deny: (item hasChildAt: 14).