tests
testConvertingDecoratedPositionToNativeWhenItBeforeSeparator
	
	| actual |
	actual := decoration convertDecoratedPosition: 6 toNativeOn: '10 000 000'.
	
	self assert: actual equals: 5