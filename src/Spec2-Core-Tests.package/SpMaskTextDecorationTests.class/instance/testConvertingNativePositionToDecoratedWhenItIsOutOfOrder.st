tests
testConvertingNativePositionToDecoratedWhenItIsOutOfOrder
	
	| actual |
	decoration mask: 'a**b'.

	actual := decoration convertNativePosition: 40 toDecoratedOn: '12'.
	
	self assert: actual equals: 4