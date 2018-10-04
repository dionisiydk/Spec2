tests
testCreationDefaultViewSpecFromMethod
	
	spec := SpViewSpec createFromMethod: self class >> testSelector.
	
	self assert: spec class equals: SpViewSpec.
	self assert: spec definingMethod == (self class >> testSelector).
	self assert: spec contexts isEmpty
	