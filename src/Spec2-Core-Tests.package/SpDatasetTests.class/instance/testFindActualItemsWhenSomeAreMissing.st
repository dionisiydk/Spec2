tests
testFindActualItemsWhenSomeAreMissing

	| actualItems foundItems |
	actualItems := {dataSource actualItems at: 1. #missingItem}.
	foundItems := dataset itemsWith: actualItems.
	
	self assert: foundItems size equals: 1.
	self assert: foundItems first class equals: SpDatasetItem.
	self assert: foundItems first actualItem equals: actualItems first.