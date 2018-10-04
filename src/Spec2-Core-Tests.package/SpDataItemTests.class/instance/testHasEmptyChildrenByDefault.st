tests
testHasEmptyChildrenByDefault

	| item |
	item := SpDataItem new.
	
	self assert: item children isEmpty