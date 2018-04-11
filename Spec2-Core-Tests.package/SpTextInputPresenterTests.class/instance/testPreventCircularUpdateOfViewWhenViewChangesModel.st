tests
testPreventCircularUpdateOfViewWhenViewChangesModel
		
	| textInputView |
	textInputView := presenter view.
	textInputView updateCount: 0. "reset any initial updates".
	
	textInputView simulateTextChange: '100'.	
	self assert: textInputView updateCount equals: 0 