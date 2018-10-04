tests
testParsingCorrectStringWithDecimalSeparatorAtTheStart

	| number |
	number := converter parseValueFromString: '.123'.
	self assert: number equals: 0.123