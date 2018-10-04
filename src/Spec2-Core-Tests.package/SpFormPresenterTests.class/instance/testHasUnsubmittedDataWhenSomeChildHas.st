tests
testHasUnsubmittedDataWhenSomeChildHas

	presenter fields first model value: 1000.
	self deny: presenter model x = 1000.
	
	self assert: presenter hasUnsubmittedData