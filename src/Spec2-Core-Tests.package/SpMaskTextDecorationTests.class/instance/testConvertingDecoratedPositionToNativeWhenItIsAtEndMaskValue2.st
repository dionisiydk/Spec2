tests
testConvertingDecoratedPositionToNativeWhenItIsAtEndMaskValue2
	
	| actual |
	decoration mask: 'a**cd'.
	
	actual := decoration convertDecoratedPosition: 5 toNativeOn: 'a12cd'.
	
	self assert: actual equals: 2