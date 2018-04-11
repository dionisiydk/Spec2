tests
testIsSubscribedOnModelChanges
		
	| textInputView |
	presenter model value: '100'.
	
	textInputView := presenter view.
	self assert: textInputView contents equals: '100'