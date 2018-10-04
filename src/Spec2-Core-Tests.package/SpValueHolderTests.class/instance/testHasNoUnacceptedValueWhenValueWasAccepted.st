tests
testHasNoUnacceptedValueWhenValueWasAccepted

	| point holder |
	point := 2@3.
	holder := point aspect x useSlot autoAcceptValues asValueHolder.
	
	holder value: 10.
	
	self deny: holder hasUnacceptedValue