tests
testPropogatesModelChanges
	| parent executed |
	executed := false.
	parent := SpMultiLabelPresenterExample new.
	presenter parent: parent.
	parent whenModelChangedDo: [ executed := true ].
	
	presenter model value: self newValueForModel.
	
	self assert: executed