tests
testDecoratingTextWithDecimalPartWithPeriodSeparator
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10000.2345'.
	
	self assert: actual equals: '10 000.2345'