tests
testStringWithAlmostOneNotDigitalCharacterShouldBeNotValid

	| actual |
	actual := restriction matches: '123.2 3'.
	
	self deny: actual