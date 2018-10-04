tests
testForcingAutoAcceptingValues

	aspect := self aspectExample.
	
	aspect autoAcceptValues.
	
	self assert: aspect allowsAutoAcceptValues