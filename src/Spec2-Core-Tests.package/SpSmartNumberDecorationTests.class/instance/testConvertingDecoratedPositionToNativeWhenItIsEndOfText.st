tests
testConvertingDecoratedPositionToNativeWhenItIsEndOfText
	
	| actual |
	actual := decoration convertDecoratedPosition: 6 toNativeOn: '10 000'.
	
	self assert: actual equals: 5