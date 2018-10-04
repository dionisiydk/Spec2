tests
testDecoratingEmptyText
	
	| actual |
	actual := decoration convertNativeTextToDecorated: ''.
	
	self assert: actual equals: ''