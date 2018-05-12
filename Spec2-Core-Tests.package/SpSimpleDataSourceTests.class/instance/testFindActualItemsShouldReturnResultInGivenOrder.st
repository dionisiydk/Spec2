tests
testFindActualItemsShouldReturnResultInGivenOrder

	| result |
	result := dataSource itemsWith: {actualItems last. actualItems first}.
	
	self assert: result equals: {dataSource itemAt: actualItems size. dataSource itemAt: 1}