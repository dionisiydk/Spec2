tests
testFindActualItems

	| actualItems foundItems |
	actualItems := {dataSource actualItems at: 1. dataSource actualItems at: 3}.
	foundItems := dataset itemsWith: actualItems.
	
	self assert: foundItems size equals: 2.
	
	foundItems do: [ :each | self assert: each class equals: SpDatasetItem].
	self assert: (foundItems collect: #actualItem) equals: actualItems