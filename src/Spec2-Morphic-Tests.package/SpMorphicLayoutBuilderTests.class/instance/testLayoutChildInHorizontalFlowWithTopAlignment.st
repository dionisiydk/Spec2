tests-flow layout
testLayoutChildInHorizontalFlowWithTopAlignment

	| child |
	child := Morph new.
	layout beFlow horizontal.
	layout layoutChildView: child with: [ :c |
		c flow vertical alignTop ].
	
	self assert: morph cellPositioning equals: #topLeft