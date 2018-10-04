tests
testConvertingNativePositionToDecoratedWhenItIsStartOfText
	
	| actual |
	actual := decoration convertNativePosition: 0 toDecoratedOn: '10 000'.
	
	self assert: actual equals: 0