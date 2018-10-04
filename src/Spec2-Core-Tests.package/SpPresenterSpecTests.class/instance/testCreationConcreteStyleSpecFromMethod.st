tests
testCreationConcreteStyleSpecFromMethod
	<forStyle: #specialStyle>
	
	spec := SpStyleSpec createFromMethod: self class >> testSelector.
	
	self assert: spec class equals: SpStyleSpec.
	self assert: spec definingMethod == (self class >> testSelector).
	self assert: spec contexts size equals: 1.
	self assert: spec contexts anyOne equals: (SpPresenterStyleContext style: #specialStyle)