tests
testConvertingDecoratedTextToNative
	
	| actual |
	actual := decoration convertDecoratedTextToNative: '10 00 0'.
	
	self assert: actual equals: '10000'