tests
testMatches

	self assert: (restriction matches: Object new).
	self deny: (restriction matches: nil)