tests
testGettingGlobalIndexOfChildItem

	| expandedItem child dataset |	
	dataset := SpDataset new.
	expandedItem := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 2).
	expandedItem dataSourceItem defaultChildren: #(1 2 3).
	expandedItem expand.

	child := expandedItem childrenDataset itemAt: 2.
	
	self assert: child actualItem equals: 2.
	self assert: child globalIndex equals: 4