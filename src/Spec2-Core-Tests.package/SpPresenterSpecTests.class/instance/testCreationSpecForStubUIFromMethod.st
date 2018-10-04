tests
testCreationSpecForStubUIFromMethod
	<forStubUI>
	
	spec := SpPresenterSpec createFromMethod: self class >> testSelector.
	
	self assert: spec contexts size equals: 1.
	self assert: spec contexts anyOne equals: (SpBackendContext fromClass: SpStubUI)