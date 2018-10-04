tests
testConvertingDecoratedPositionToNative
	
	| actual |
	decoration mask: 'a***b'.

	actual := decoration convertDecoratedPosition: 3 toNativeOn: 'a123b'.
	
	self assert: actual equals: 2