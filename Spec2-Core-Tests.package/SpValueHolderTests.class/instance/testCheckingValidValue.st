tests
testCheckingValidValue

	| point holder |
	point := 2@3.
	holder := point aspect x 
		useSlot;
		restriction: (SpNumberValueRestriction minValue: 1 maxValue: 10); 
		asValueHolder.
	
	holder value: 5.
	
	self assert: holder isValid