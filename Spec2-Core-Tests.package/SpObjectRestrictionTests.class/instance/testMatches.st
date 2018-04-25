tests
testMatches

	self assert: (restriction matches: true).
	self assert: (restriction matches: false).
	self assert: (restriction matches: Boolean basicNew).
	
	self deny: (restriction matches: 1)
	