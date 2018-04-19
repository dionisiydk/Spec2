tests
testChangesPropogationShouldDeliverSourcePresenter

	| changes |
	presenter whenModelChangedDo: [:ann | changes := ann ].
	
	presenter label1 propogateChanges.
	
	self assert: changes class equals: SpModelChanged.
	self assert: changes sourcePresenter equals: presenter label1.