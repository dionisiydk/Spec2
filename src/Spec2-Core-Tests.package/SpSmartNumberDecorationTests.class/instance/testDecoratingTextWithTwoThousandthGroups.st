tests
testDecoratingTextWithTwoThousandthGroups
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10123000'.
	
	self assert: actual equals: '10 123 000'