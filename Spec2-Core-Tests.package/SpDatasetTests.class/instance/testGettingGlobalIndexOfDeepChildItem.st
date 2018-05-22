tests
testGettingGlobalIndexOfDeepChildItem

	| expandedItem child deepChild |
	expandedItem := dataset itemAt: 2.
	expandedItem dataSourceItem defaultChildren: #(4 5 3).
	expandedItem expand.
	
	child := dataset itemAt: 4.
	self assert: child actualItem equals: 5.
	child dataSourceItem defaultChildren: #(7 8 9).
	child expand.
	
	deepChild := dataset itemAt: 5.
	self assert: deepChild actualItem equals: 7.
	self assert: deepChild globalIndex equals: 5.