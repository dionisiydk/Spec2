tests
testConvertingDecoratedTextToNative
	
	| actual |
	
	actual := decoration convertDecoratedTextToNative: 'some text'.
	self assert: actual equals: 'some text'