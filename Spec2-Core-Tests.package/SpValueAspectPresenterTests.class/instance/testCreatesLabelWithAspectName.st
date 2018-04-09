tests
testCreatesLabelWithAspectName
		
	| aspect |
	aspect := presenter model aspect.
	
	self assert: presenter view contents first class equals: SpLabelViewStub.
	self assert: presenter view contents first contents equals: aspect name.