tests
testConvertingDecoratedPositionToNativeWhenItIsAtMaskValue
	
	| actual |
	decoration mask: 'ab***c'.
	
	actual := decoration convertDecoratedPosition: 1 toNativeOn: 'ab123b'.
	
	self assert: actual equals: 1