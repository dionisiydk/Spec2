tests
testFindActualItemsWhenSomeIsMissing

	| result |
	result := dataSource itemsWith: {actualItems first. #missingItem. actualItems last}.
	
	self assertItems: result equals: {dataSource itemAt: 1. nil. dataSource itemAt: actualItems size}