tests
testConvertingDecoratedPositionToNativeWhenItIsOutOfBounds
	
	| actual |
	decoration mask: 'a**c'.

	actual := decoration convertDecoratedPosition: 10 toNativeOn: 'a12c'.
	
	self assert: actual equals: 2