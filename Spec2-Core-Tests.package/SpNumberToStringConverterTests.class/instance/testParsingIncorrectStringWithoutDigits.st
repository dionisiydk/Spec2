tests
testParsingIncorrectStringWithoutDigits

	self should: [converter parseValueFromString: 'abc'] raise: SpBadStringFormat