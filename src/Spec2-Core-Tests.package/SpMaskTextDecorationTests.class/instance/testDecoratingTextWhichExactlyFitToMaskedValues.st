tests
testDecoratingTextWhichExactlyFitToMaskedValues

	| actual |
	decoration mask: 'a***b'.
	
	actual := decoration convertNativeTextToDecorated: '123'.
	self assert: actual equals: 'a123b'