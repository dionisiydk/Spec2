tests
testAllowAnyValueByDefault

	aspect := self aspectExample.
	
	self assert: aspect restriction == SpAnyValueRestriction default