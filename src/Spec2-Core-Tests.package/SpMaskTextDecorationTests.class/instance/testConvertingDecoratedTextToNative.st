tests
testConvertingDecoratedTextToNative
	
	| actual |
	decoration mask: 'a***b'.
	
	actual := decoration convertDecoratedTextToNative: 'a123b'.
	
	self assert: actual equals: '123'