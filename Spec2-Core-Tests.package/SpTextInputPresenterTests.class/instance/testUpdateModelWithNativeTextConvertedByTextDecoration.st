tests
testUpdateModelWithNativeTextConvertedByTextDecoration
		
	| textInputView |
	presenter textDecoration: SpSmartNumberDecoration default.
	textInputView := presenter view.
	
	textInputView simulateTextChange: '1 000'. "It is decorated text visible to user due to given decoration"	
	
	self assert: presenter model value equals: '1000'