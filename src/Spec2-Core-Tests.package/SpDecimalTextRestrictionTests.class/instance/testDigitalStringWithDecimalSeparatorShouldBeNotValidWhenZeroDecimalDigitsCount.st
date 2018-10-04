tests
testDigitalStringWithDecimalSeparatorShouldBeNotValidWhenZeroDecimalDigitsCount

	| actual |
	restriction decimalDigitsCount: 0.
	
	actual := restriction matches: '1.3'.
	
	self deny: actual