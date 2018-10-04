tests
testConvertingNativeTextToDecorated
	
	| actual |
	
	actual := decoration convertNativeTextToDecorated: 'some text'.
	self assert: actual equals: 'some text'