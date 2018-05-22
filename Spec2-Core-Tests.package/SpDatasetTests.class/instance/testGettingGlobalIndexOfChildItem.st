tests
testGettingGlobalIndexOfChildItem

	| expandedItem child |
	expandedItem := dataset itemAt: 2.
	expandedItem dataSourceItem defaultChildren: #(4 5 3).
	expandedItem expand.

	child := dataset itemAt: 4.
	
	self assert: child actualItem equals: 5.
	self assert: child globalIndex equals: 4.