tests
testWritingValueUsingDirectSlotAccess
	
	| point |
	point := 2@3.
	aspect := point aspect x useDirectSlot build.
	
	aspect writeValue: 10.
	
	self assert: point x equals: 10