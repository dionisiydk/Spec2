tests
testConvertingDecoratedPositionToNativeWhenItIsAtMaskValue2
	
	| actual |
	decoration mask: 'ab***c'.
	
	actual := decoration convertDecoratedPosition: 2 toNativeOn: 'ab123b'.
	
	self assert: actual equals: 1