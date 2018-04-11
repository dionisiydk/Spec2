tests
testCheckingInvalidValue

	| point holder |
	point := 2@3.
	holder := point aspect x 
		useSlot;
		restriction: (SpNumberRestriction minValue: 1 maxValue: 10); 
		asValueHolder.
	
	holder value: 20.
	
	self deny: holder isValid