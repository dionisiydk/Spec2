tests
testConvertingDecoratedPositionToNativeWhenItIsZero
	
	| actual |
	decoration mask: 'a**c'.

	actual := decoration convertDecoratedPosition: 0 toNativeOn: 'a12b'.
	
	self assert: actual equals: 0