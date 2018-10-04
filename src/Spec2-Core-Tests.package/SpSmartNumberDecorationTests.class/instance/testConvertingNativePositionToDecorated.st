tests
testConvertingNativePositionToDecorated
	
	| actual |
	actual := decoration convertNativePosition: 3 toDecoratedOn: '10 000'.
	
	self assert: actual equals: 4