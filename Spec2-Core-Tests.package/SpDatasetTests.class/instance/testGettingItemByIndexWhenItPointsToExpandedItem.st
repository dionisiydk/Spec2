tests
testGettingItemByIndexWhenItPointsToExpandedItem

	| item expandedItem |
	expandedItem := dataset itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(4 5 3).
	expandedItem expand.

	item := dataset itemAt: 2.
	
	self assert: item class equals: SpDatasetItem.
	self assert: item dataSourceItem class equals: SpDataItem.
	self assert: item actualItem equals: (dataSource actualItems at: 4).
	self assert: item ownerDataset equals: expandedItem childrenDataset