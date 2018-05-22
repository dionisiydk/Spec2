tests
testCollapse

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualitem named: 'some item').
	item dataSourceItem defaultChildren: #(1 2 3).
	item expand.

	item collapse.
	
	self deny: (dataset expandedItems includes: item).
	self assert: item childrenDataset isNil