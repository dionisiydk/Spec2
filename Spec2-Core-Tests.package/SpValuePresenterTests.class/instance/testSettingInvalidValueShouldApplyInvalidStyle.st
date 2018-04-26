tests
testSettingInvalidValueShouldApplyInvalidStyle
		
	presenter model valueAspect restriction: (SpNumberRestriction minValue: 500).
	presenter model value: 100.
	self deny: presenter model isValid.
	
	self assert: presenter currentStyle equals: #invalid