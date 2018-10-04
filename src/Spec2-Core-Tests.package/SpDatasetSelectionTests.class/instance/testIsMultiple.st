tests
testIsMultiple
	
	selection beSingle.
	self deny: selection isMultiple.
	
	selection beMultiple.
	self assert: selection isMultiple.
	