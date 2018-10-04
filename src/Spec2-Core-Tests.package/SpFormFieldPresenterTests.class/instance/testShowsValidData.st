tests
testShowsValidData
		
	self assert: presenter showsValidData.
	
	presenter model valueAspect restriction: (SpNumberRestriction minValue: 500).
	presenter model value: 100.
	
	self deny: presenter model isValid.
	self deny: presenter showsValidData