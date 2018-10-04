tests-flow layout
testBeFlowWithBottomLeftAlignment

	layout beFlow alignBottomLeft.
	
	self assert: morph listCentering equals: #topLeft.
	self assert: morph wrapCentering equals: #bottomRight