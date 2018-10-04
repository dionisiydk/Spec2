tests
testConvertingDecoratedTextToNativeWhenThereAreEmptyValues
	
	| actual |
	decoration mask: 'a***-***b'.
	
	actual := decoration convertDecoratedTextToNative: 'a1*3-*4*b'.
	
	self assert: actual equals: '1*3*4*'