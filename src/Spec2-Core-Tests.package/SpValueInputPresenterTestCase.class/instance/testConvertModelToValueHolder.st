tests
testConvertModelToValueHolder

	presenter model: model valueAspect.
	
	self assert: presenter model class equals: SpValueHolder.
	self assert: presenter model valueAspect class equals: model valueAspect class