tests
testParsingEmptyString

	| number |
	number := converter parseValueFromString: ''.
	self assert: number equals: nil