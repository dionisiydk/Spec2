tests
testParsingCorrectStringWithDecimalSeparatorAtTheEnd

	| number |
	number := converter parseValueFromString: '123.'.
	self assert: number equals: 123