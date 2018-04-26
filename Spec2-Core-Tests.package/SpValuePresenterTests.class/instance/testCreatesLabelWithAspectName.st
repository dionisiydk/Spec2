tests
testCreatesLabelWithAspectName
		
	| aspect labelContainer |
	aspect := presenter model valueAspect.
	
	labelContainer := presenter view contents first.
	self assert: labelContainer class equals: SpCompositeViewStub.
	self assert: labelContainer contents first class equals: SpLabelViewStub.
	self assert: labelContainer contents first contents equals: aspect name.
	self assert: labelContainer contents second class equals: SpLabelViewStub.
	self assert: labelContainer contents second contents equals: ':'.