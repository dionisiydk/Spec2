tests
testMatches

	self assert: (restriction matches: '').
	self assert: (restriction matches: '1234').
	self deny: (restriction matches: Object new)