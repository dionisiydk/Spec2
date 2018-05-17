tests
testCreatesTextInputWhichAffectGivenModel
		
	| textInputView |
	textInputView := presenter view contents detect: [ :each | each class = SpTextInputViewStub].
	
	textInputView simulateTextChange: '5'.
	
	self assert: textInputView contents equals: '5'.
	self assert: presenter model value equals: 5