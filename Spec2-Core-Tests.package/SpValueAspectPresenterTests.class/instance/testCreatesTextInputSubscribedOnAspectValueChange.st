tests
testCreatesTextInputSubscribedOnAspectValueChange
		
	| textInputView |
	presenter model value: 100.
	
	textInputView := presenter view contents detect: [ :each | each class = SpTextInputViewStub].
	self assert: textInputView contents equals: '100'