tests
testParsingValueFromString

	self should: [converter parseValueFromString: 'any string'] raise: Error