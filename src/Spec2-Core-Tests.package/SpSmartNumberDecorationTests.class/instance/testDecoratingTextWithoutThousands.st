tests
testDecoratingTextWithoutThousands
	
	| actual |
	actual := decoration convertNativeTextToDecorated: '10'.
	
	self assert: actual equals: '10'