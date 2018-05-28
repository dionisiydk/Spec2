tests
testFindActualItemsWhenTheyBelongToExpandedChildren

	| foundItems expandedItem |
	expandedItem := dataset itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(a s d).
	expandedItem expand.

	foundItems := dataset itemsWith: #(s).
	
	self assert: foundItems size equals: 1.
	self assert: foundItems first actualItem equals: #s