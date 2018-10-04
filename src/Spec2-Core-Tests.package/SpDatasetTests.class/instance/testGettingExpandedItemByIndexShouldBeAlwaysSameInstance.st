tests
testGettingExpandedItemByIndexShouldBeAlwaysSameInstance

	| item expandedItem |
	expandedItem := dataset itemAt: 2.
	expandedItem dataSourceItem defaultChildren: #(4 5 3).
	expandedItem expand.

	item := dataset itemAt: 2.
	
	self assert: item == expandedItem