tests
testConvertModelToPrintedValueHolder

	| givenModel |
	givenModel := (2@3) aspect x asValueHolder.
	presenter model: givenModel.
	
	self assert: presenter model class equals: SpPrintedValueHolder.
	self assert: presenter model baseValueHolder equals: givenModel.
	self assert: presenter model stringConverter equals: givenModel aspect stringConverter.