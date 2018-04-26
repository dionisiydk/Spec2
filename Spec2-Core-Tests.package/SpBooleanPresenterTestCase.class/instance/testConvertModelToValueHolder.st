tests
testConvertModelToValueHolder

	presenter model: true aspect itself.
	
	self assert: presenter model class equals: SpValueHolder.
	self assert: presenter model valueAspect class equals: SpSimpleValueAspect