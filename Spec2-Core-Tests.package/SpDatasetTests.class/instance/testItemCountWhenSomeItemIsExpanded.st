tests
testItemCountWhenSomeItemIsExpanded

	| expandedItem |
	expandedItem := dataset itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(4 5 3).
	expandedItem expand.
	
	self assert: dataset itemCount equals: dataSource itemCount + 3