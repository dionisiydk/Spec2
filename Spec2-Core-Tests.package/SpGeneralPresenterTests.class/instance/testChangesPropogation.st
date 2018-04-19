tests
testChangesPropogation

	| executed |
	presenter whenModelChangedDo: [ executed := true ].
	
	presenter label1 propogateChanges.
	
	self assert: executed