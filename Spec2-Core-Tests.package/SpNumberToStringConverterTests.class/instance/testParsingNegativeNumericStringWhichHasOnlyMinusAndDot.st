tests
testParsingNegativeNumericStringWhichHasOnlyMinusAndDot

	| number |
	number := converter parseValueFromString: '-.'.
	self assert: number equals: 0