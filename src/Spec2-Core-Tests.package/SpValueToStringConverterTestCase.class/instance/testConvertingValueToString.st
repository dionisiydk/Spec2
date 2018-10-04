tests
testConvertingValueToString

	| actual expected |
	actual := converter convertValueToString: self valueExample.
	
	expected := self convertedValueExample.	
	self assert: actual equals: expected