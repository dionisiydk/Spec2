tests
testComparisonWithAnotherSpecWithDifferentMethod
	
	| copy |
	copy := spec copy.
	spec definingMethod: self class >> testSelector.
	
	self deny: spec equals: copy