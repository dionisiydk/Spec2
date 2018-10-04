tests
testIsSingle
	
	selection beSingle.
	self assert: selection isSingle.
	
	selection beMultiple.
	self deny: selection isSingle.
	