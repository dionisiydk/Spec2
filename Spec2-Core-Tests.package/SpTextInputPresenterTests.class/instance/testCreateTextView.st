tests
testCreateTextView
		
	| textInputView |
	textInputView := presenter view.
	
	self assert: textInputView class equals: SpTextInputViewStub 