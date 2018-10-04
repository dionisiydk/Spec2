tests
testConvertingDecoratedPositionToNativeWhenItIsSingleMaskAtMiddle
	
	| actual |
	decoration mask: 'a**b**c'.
	
	actual := decoration convertDecoratedPosition: 4 toNativeOn: 'a12b34c'.
	
	self assert: actual equals: 3