tests
testParsingIncorrectStringWhichBeginsWithDigits

	self should: [converter parseValueFromString: '123avc'] raise: SpBadStringFormat