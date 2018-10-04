tests
testSelectingActualItemsWhenTheyPartOfExpandedChildren
	
	| expandedItem |
	expandedItem := dataset itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(a b c).
	expandedItem expand.
	
	selection selectItemsWith: #(b).
	
	self assert: selection actualItems equals: #(b).
	self assert: selection itemIndexes equals: #(3).