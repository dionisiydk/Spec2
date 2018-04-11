tests
testParsingIncorrectStringWithMultipleDecimalSeparators

	self should: [converter parseValueFromString: '1.2.3'] raise: SpBadStringFormat