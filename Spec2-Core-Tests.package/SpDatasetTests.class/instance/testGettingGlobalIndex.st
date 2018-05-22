tests
testGettingGlobalIndex

	| item |
	item := dataset itemAt: 2.
	
	self assert: item globalIndex equals: 2