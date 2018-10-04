tests
testMatchesAnyText
	
	self assert: (restriction matches: '').
	self assert: (restriction matches: 'some string')