tests
testFindActualItems

	| result |
	result := dataSource itemsWith: {actualItems first}.
	
	self assertItems: result equals: {dataSource itemAt: 1}