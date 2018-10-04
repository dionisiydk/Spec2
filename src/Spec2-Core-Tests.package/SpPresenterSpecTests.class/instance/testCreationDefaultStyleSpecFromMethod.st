tests
testCreationDefaultStyleSpecFromMethod
	
	spec := SpStyleSpec createFromMethod: self class >> testSelector.
	
	self assert: spec class equals: SpStyleSpec.
	self assert: spec definingMethod == (self class >> testSelector).
	self assert: spec contexts isEmpty