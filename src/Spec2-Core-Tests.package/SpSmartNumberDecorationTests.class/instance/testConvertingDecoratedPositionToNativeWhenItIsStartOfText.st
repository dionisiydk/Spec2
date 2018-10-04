tests
testConvertingDecoratedPositionToNativeWhenItIsStartOfText
	
	| actual |
	actual := decoration convertDecoratedPosition: 0 toNativeOn: '10 000'.
	
	self assert: actual equals: 0