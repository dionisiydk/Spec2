tests
testConvertingNativePositionToDecorated
	
	| actual |
	
	actual := decoration convertNativePosition: 5 toDecoratedOn: 'some text'.
	self assert: actual equals: 5