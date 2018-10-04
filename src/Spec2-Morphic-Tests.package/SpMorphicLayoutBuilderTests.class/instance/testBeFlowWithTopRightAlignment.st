tests-flow layout
testBeFlowWithTopRightAlignment

	layout beFlow alignTopRight.
	
	self assert: morph listCentering equals: #bottomRight.
	self assert: morph wrapCentering equals: #topLeft