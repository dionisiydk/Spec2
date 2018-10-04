tests
testConvertingDecoratedPositionToNative2
	
	| actual |
	actual := decoration convertDecoratedPosition: 6 toNativeOn: '10 0 00'.
	
	self assert: actual equals: 4