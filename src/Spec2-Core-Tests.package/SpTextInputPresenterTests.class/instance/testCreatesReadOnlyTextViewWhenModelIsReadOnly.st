tests
testCreatesReadOnlyTextViewWhenModelIsReadOnly

	| givenModel |
	givenModel := (2@3) aspect x readOnly asValueHolder.
	presenter model: givenModel.
	presenter rebuild.
	
	self assert: presenter view isReadOnly