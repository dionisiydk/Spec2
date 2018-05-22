tests
testExpand

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualitem named: 'some item').
	item dataSourceItem defaultChildren: #(1 2 3).
	
	item expand.
	
	self assert: (dataset expandedItems includes: item).
	self assert: item childrenDataset class equals: SpDataset.
	self assert: item childrenDataset actualItems equals: #(1 2 3).
	self assert: item childrenDataset parentItem equals: item.
	self assert: item childrenDataset depth equals: 1