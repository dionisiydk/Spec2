tests
testMatchesAnyObject
	
	self assert: (restriction matches: Object new).
	self assert: (restriction matches: nil).