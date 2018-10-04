tests
testReadingValueUsingDirectSlotAccess
	
	aspect := (2@3) aspect x useSlot build.
	
	self assert: aspect readValue equals: 2