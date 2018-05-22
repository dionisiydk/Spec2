tests
testExpandShouldOpenNewDataset

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualitem named: 'some item').
	item dataSourceItem defaultChildren: (SpChildrenForTest items: #(1 2 3)).
	
	item expand.
	
	self assert: item childrenDataset dataSource wasOpened