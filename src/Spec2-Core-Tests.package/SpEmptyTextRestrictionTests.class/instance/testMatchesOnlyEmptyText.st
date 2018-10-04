tests
testMatchesOnlyEmptyText
	
	self assert: (restriction matches: '').
	self deny: (restriction matches: 'some string')