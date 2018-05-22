tests
testCollapseShouldCloseCollapsedDataset

	| item dataset expandedDataSource |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualitem named: 'some item').
	item dataSourceItem defaultChildren: (SpChildrenForTest items: #(1 2 3)).
	item expand.
	expandedDataSource := item childrenDataset dataSource.
	
	item collapse.
	
	self assert: expandedDataSource wasClosed