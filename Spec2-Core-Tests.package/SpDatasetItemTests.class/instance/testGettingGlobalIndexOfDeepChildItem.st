tests
testGettingGlobalIndexOfDeepChildItem

	| expandedItem child deepChild dataset |
	dataset := SpDataset new.
	expandedItem := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 2).
	expandedItem dataSourceItem defaultChildren: #(1 2 3).
	expandedItem expand.
	
	child := expandedItem childrenDataset itemAt: 2.
	self assert: child actualItem equals: 2.
	child dataSourceItem defaultChildren: #(7 8 9).
	child expand.
	
	deepChild := child childrenDataset itemAt: 1.
	self assert: deepChild actualItem equals: 7.
	self assert: deepChild globalIndex equals: 5.