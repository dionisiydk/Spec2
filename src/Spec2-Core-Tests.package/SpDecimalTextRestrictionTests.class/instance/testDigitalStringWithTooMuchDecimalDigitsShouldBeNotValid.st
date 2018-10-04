tests
testDigitalStringWithTooMuchDecimalDigitsShouldBeNotValid

	| actual |
	restriction decimalDigitsCount: 1.
	actual := restriction matches: '123.34'.
	
	self deny: actual