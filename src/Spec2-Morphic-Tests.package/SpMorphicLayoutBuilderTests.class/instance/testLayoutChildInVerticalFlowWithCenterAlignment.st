tests-flow layout
testLayoutChildInVerticalFlowWithCenterAlignment

	| child |
	child := Morph new.
	layout beFlow vertical.
	layout layoutChildView: child with: [ :c |
		c flow horizontal alignCenter ].
	
	self assert: morph cellPositioning equals: #topCenter