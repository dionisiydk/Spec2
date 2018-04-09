tests
testConvertModelToValueHolder

	self assert: presenter model class equals: SpValueHolder.
	self assert: presenter model aspect equals: SpObjectPropertyAspect.