tests
testConvertingDecoratedPositionToNative
	
	| actual |
	
	actual := decoration convertDecoratedPosition: 5 toNativeOn: 'some text'.
	self assert: actual equals: 5