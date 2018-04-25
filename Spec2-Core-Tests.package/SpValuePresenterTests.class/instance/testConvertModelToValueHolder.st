tests
testConvertModelToValueHolder

	presenter model: (2@3) aspect x.
	
	self assert: presenter model class equals: SpValueHolder.
	self assert: presenter model aspect class equals: SpObjectPropertyAspect.