tests
testSubmittingData

	presenter fields first model value: 1000.
	self deny: presenter model x = 1000.
	
	presenter submitData.  
	
	self assert: presenter model x equals: 1000