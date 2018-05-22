tests
testSortsExpandedItemsByIndex

	| item1 item2 |
	item1 := dataset itemAt: 1.
	item1 dataSourceItem defaultChildren: #(4 5).
	item2 := dataset itemAt: 2.
	item2 dataSourceItem defaultChildren: #(7 8).

	item2 expand.
	item1 expand.
	
	self assert: dataset expandedItems asArray equals: { item1. item2 }