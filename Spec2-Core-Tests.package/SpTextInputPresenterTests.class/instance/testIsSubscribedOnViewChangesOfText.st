tests
testIsSubscribedOnViewChangesOfText
		
	| textInputView |
	textInputView := presenter view.
	
	textInputView simulateTextChange: '100'.	
	
	self assert: presenter model value equals: '100'