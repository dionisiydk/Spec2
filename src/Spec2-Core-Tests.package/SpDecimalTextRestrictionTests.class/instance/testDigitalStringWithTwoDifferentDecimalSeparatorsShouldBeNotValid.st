tests
testDigitalStringWithTwoDifferentDecimalSeparatorsShouldBeNotValid

	| actual |
	restriction decimalSeparators: ',.'.
	
	actual := restriction matches: '1,23.'.
	
	self deny: actual