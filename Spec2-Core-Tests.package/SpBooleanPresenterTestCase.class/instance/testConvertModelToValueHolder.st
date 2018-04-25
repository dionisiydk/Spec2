tests
testConvertModelToValueHolder

	presenter model: true aspect itself.
	
	self assert: presenter model class equals: SpValueHolder.
	self assert: presenter model aspect class equals: SpSimpleValueAspect