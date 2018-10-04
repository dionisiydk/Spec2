tests-flow layout
testBeFlowWithTopLeftAlignment

	layout beFlow alignTopLeft.
	
	self assert: morph listCentering equals: #topLeft.
	self assert: morph wrapCentering equals: #topLeft