tests
testEmptyStringShouldBeValid

	| actual |
	actual := restriction matches: ''.
	
	self assert: actual