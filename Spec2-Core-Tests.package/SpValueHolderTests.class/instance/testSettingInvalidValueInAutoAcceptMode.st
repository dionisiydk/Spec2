tests
testSettingInvalidValueInAutoAcceptMode

	| point holder |
	point := 2@3.
	holder := point aspect x 
		useSlot;
		restriction: (SpNumberRestriction minValue: 1 maxValue: 10); 
		autoAcceptValues;
		asValueHolder.
	
	holder value: 20.
	
	self assert: point x equals: 2.
	self assert: holder value equals: 20