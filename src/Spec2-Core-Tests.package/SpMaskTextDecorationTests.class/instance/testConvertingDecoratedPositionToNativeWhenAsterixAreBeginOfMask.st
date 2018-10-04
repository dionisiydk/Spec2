tests
testConvertingDecoratedPositionToNativeWhenAsterixAreBeginOfMask
	
	| actual |
	decoration mask: '**ab'.

	actual := decoration convertDecoratedPosition: 1 toNativeOn: '12ab'.
	
	self assert: actual equals: 1