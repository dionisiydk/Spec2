tests
testOnlyDecimalSeparatorShouldBeValid

	| actual |
	actual := restriction matches: '.'.
	
	self assert: actual