tests
testDigitalStringWithTwoDecimalSeparatorsShouldBeNotValid

	| actual |
	actual := restriction matches: '12.3.3'.
	
	self deny: actual