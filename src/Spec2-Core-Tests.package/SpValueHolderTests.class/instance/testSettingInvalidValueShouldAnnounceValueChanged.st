tests
testSettingInvalidValueShouldAnnounceValueChanged

	| point holder announced |
	announced := false.
	point := 2@3.
	holder := point aspect x 
		useSlot;
		restriction: (SpNumberRestriction minValue: 1 maxValue: 10); 
		asValueHolder.
	holder whenChangedDo: [ announced := true ].
	
	holder value: 20.
	
	self assert: announced