tests
testDigitalStringWithFirstDecimalSeparatorShouldBeValid

	| actual |
	actual := restriction matches: '.1'.
	
	self assert: actual