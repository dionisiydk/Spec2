tests
testStringWithDecimalDigitsShouldBeValid

	| actual |
	actual := restriction matches: '123.23'.
	
	self assert: actual