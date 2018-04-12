tests
testHasReadOnlyStateByDefault

	aspect := SpObjectPropertyAspect new.
	
	self assert: aspect isReadOnly equals: aspect isAlwaysReadOnly