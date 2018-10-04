tests
testDigitalStringWithSecondDecimalSeparatorShouldBeValid

	| actual |
	restriction decimalSeparators: '.,'.
	
	actual := restriction matches: '1,3'.
	
	self assert: actual