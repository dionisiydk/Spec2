tests
testConvertingNilValueToString

	| actual |
	actual := converter convertValueToString: nil.
	
	self assert: actual isString