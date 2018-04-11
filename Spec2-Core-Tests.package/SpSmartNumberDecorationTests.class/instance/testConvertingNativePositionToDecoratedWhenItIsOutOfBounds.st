tests
testConvertingNativePositionToDecoratedWhenItIsOutOfBounds
	
	| actual |
	actual := decoration convertNativePosition: 10 toDecoratedOn: '10 000'.
	
	self assert: actual equals: '10 000' size