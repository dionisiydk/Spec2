tests
testParsingNegativeNumericString

	| number |
	number := converter parseValueFromString: '-1.23'.
	self assert: number equals: -1.23