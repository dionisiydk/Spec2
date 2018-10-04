tests
testConvertingDecoratedPositionToNative
	
	| actual |
	actual := decoration convertDecoratedPosition: 3 toNativeOn: '10 000'.
	
	self assert: actual equals: 2