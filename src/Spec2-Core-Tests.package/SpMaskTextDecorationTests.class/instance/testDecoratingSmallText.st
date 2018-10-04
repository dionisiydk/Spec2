tests
testDecoratingSmallText

	| actual |
	decoration mask: 'a***b'.
	
	actual := decoration convertNativeTextToDecorated: '12'.
	self assert: actual equals: 'a12*b'