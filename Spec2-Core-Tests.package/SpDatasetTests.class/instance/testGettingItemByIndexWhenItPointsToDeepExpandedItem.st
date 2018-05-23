tests
testGettingItemByIndexWhenItPointsToDeepExpandedItem

	| item expandedItem child |
	expandedItem := dataset itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(4 5 3).
	expandedItem expand.

	child := dataset itemAt: 2.
	child dataSourceItem defaultChildren: #(7 8 9).
	child expand.	
	
	item := dataset itemAt: 3.
	self assert: item class equals: SpDatasetItem.
	self assert: item dataSourceItem class equals: SpDataItem.
	self assert: item actualItem equals: 7.
	self assert: item ownerDataset equals: child childrenDataset