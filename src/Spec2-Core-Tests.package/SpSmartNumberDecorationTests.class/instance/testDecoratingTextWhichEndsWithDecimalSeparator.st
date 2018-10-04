tests
testDecoratingTextWhichEndsWithDecimalSeparator
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10000.'.
	
	self assert: actual equals: '10 000.'