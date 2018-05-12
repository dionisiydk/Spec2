tests
testFindActualItems

	| result |
	result := dataSource itemsWith: {actualItems first}.
	
	self assert: result equals: {dataSource itemAt: 1}