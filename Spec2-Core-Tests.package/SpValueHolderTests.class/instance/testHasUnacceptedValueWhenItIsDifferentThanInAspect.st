tests
testHasUnacceptedValueWhenItIsDifferentThanInAspect

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot asValueHolder.
	
	holder value: 10.
	
	self assert: holder hasUnacceptedValue
	