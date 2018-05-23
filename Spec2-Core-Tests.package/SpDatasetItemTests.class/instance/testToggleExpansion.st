tests
testToggleExpansion

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	item dataSourceItem defaultChildren: #(1 2 3).
	
	item toggleExpansion.
	self assert: (dataset expandedItems includes: item).
	item toggleExpansion.
	self deny: (dataset expandedItems includes: item).