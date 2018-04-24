tests
testNotAllowAutoAcceptingValuesByDefault

	aspect := self aspectExample.
	
	self deny: aspect allowsAutoAcceptValues