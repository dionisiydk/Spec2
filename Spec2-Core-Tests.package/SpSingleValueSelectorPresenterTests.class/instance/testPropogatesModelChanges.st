tests
testPropogatesModelChanges
	| parent executed |
	executed := false.
	parent := SpMultiLabelPresenterExample new.
	presenter parent: parent.
	parent whenModelChangedDo: [ executed := true ].
	
	presenter model value: 100.
	
	self assert: executed