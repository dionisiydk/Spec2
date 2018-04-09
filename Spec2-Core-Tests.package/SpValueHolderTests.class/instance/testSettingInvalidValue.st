tests
testSettingInvalidValue

	| point holder |
	point := 2@3.
	holder := point aspect x 
		useSlot;
		restriction: (SpNumberValueRestriction minValue: 1 maxValue: 10); 
		asValueHolder.
	
	holder value: 20.
	
	self assert: point x equals: 2.
	self assert: holder value equals: 20