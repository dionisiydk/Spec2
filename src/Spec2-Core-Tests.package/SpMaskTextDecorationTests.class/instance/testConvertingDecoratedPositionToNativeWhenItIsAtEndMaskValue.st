tests
testConvertingDecoratedPositionToNativeWhenItIsAtEndMaskValue
	
	| actual |
	decoration mask: 'a**cd'.
	
	actual := decoration convertDecoratedPosition: 6 toNativeOn: 'a12cd'.
	
	self assert: actual equals: 2