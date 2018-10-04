tests
testMatchesOnlyNil
	
	self assert: (restriction matches: nil).
	self deny: (restriction matches: Object new)