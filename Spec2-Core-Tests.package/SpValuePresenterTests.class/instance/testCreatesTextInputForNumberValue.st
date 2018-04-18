tests
testCreatesTextInputForNumberValue
		
	| aspect textInputView |
	aspect := presenter model aspect.
	textInputView := presenter view contents detect: [ :each | each class = SpTextInputViewStub].
	self assert: textInputView contents equals: aspect readValue asString.
	self 
		assert: textInputView textDecoration 
		equals: aspect inputPresenter textDecoration.
	self 
		assert: textInputView inputRestriction 
		equals: aspect inputPresenter inputRestriction