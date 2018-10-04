tests
testConvertingDecoratedPositionToNativeWhenItIsLastAsterixAtMiddle
	
	| actual |
	decoration mask: '8(***)***-**-**'.
	
	actual := decoration convertDecoratedPosition: 5 toNativeOn: '8(***)***-**-**'.
	
	self assert: actual equals: 3