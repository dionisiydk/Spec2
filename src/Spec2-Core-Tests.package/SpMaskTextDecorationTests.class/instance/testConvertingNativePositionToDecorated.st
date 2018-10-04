tests
testConvertingNativePositionToDecorated
	
	| actual |
	decoration mask: 'a***b'.

	actual := decoration convertNativePosition: 2 toDecoratedOn: '123'.
	
	self assert: actual equals: 3