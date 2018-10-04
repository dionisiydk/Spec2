tests
testMatches

	self assert: (restriction matches: 25).
	self deny: (restriction matches: 14).
	self deny: (restriction matches: 35)