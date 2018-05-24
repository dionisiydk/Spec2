tests
testHasZeroDepthByDefault

	| item |
	item := SpDataItem new.
	
	self assert: item depth equals: 0