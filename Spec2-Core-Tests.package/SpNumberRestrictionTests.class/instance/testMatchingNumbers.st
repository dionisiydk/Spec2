tests
testMatchingNumbers

	restriction := SpNumberRestriction minValue: 10 maxValue: 20.
	
	self assert: (restriction matches: 12).
	self assert: (restriction matches: 20).
	self assert: (restriction matches: 10).
	self deny: (restriction matches: 5).
	self deny: (restriction matches: 40)