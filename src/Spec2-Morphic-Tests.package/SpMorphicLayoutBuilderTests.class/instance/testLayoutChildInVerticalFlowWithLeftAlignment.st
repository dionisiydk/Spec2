tests-flow layout
testLayoutChildInVerticalFlowWithLeftAlignment

	| child |
	child := Morph new.
	layout beFlow vertical.
	layout layoutChildView: child with: [ :c |
		c flow horizontal alignLeft ].
	
	self assert: morph cellPositioning equals: #topLeft