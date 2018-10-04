tests-flow layout
testBeFlowWithCenterLeftAlignment

	layout beFlow alignCenterLeft.
	
	self assert: morph listCentering equals: #topLeft.
	self assert: morph wrapCentering equals: #center