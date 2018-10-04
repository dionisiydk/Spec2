tests
testComparisonWithCopy
	
	| copy |
	copy := spec copy.
	
	self assert: spec equals: copy.
	self assert: spec hash equals: copy hash