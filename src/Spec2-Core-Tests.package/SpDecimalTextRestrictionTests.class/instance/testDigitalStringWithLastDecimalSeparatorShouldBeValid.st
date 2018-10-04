tests
testDigitalStringWithLastDecimalSeparatorShouldBeValid

	| actual |
	actual := restriction matches: '123.'.
	
	self assert: actual