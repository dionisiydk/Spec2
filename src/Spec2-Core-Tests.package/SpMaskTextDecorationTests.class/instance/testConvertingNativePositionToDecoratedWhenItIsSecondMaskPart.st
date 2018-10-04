tests
testConvertingNativePositionToDecoratedWhenItIsSecondMaskPart
	
	| actual |
	decoration mask: 'a**b**c'.

	actual := decoration convertNativePosition: 4 toDecoratedOn: '1234'.
	
	self assert: actual equals: 6