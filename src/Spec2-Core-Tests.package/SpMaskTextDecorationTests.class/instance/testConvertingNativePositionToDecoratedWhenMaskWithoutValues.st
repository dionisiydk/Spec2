tests
testConvertingNativePositionToDecoratedWhenMaskWithoutValues
	
	| actual |
	decoration mask: 'ab'.

	actual := decoration convertNativePosition: 1 toDecoratedOn: 'ab'.
	
	self assert: actual equals: 2