tests
testDecoratingTooBigText

	| actual |
	decoration mask: 'a***b'.
	
	actual := decoration convertNativeTextToDecorated: '1234'.
	self assert: actual equals: 'a123b'