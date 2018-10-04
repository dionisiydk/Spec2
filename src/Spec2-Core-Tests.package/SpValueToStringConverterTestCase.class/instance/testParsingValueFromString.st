tests
testParsingValueFromString

	| actual expected |
	actual := converter parseValueFromString: self convertedValueExample.
	expected := self valueExample.
	
	self assert: actual equals: expected