tests
testSubmittingData
	
	| point |
	point := 2@3.
	presenter model: point aspect x useSlot.
	presenter model value: 1000.
	
	self assert: point x equals: 2.
	presenter submitData.
	self assert: point x equals: 1000.