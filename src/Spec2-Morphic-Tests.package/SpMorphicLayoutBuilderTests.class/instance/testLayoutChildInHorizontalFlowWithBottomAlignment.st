tests-flow layout
testLayoutChildInHorizontalFlowWithBottomAlignment

	| child |
	child := Morph new.
	layout beFlow horizontal.
	layout layoutChildView: child with: [ :c |
		c flow vertical alignBottom ].
	
	self assert: morph cellPositioning equals: #bottomLeft