tests-flow layout
testLayoutChildInHorizontalFlowWithCenterAlignment

	| child |
	child := Morph new.
	layout beFlow horizontal.
	layout layoutChildView: child with: [ :c |
		c flow vertical alignCenter ].
	
	self assert: morph cellPositioning equals: #leftCenter