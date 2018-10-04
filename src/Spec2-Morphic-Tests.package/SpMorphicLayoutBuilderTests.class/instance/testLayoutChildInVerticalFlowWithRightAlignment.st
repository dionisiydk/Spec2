tests-flow layout
testLayoutChildInVerticalFlowWithRightAlignment

	| child |
	child := Morph new.
	layout beFlow vertical.
	layout layoutChildView: child with: [ :c |
		c flow horizontal alignRight ].
	
	self assert: morph cellPositioning equals: #topRight