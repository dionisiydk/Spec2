tests
testFindActualItemsShouldReturnResultInGivenOrder

	| result |
	result := dataSource itemsWith: {actualItems last. actualItems first}.
	
	self assertItems: result equals: {dataSource itemAt: actualItems size. dataSource itemAt: 1}