tests
testGettingAllActualItems

	| allItems |
	allItems := dataset actualItems.
	
	self assert: allItems equals: dataSource actualItems