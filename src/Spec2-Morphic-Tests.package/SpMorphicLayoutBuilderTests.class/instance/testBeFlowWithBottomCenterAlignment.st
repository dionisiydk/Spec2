tests-flow layout
testBeFlowWithBottomCenterAlignment

	layout beFlow alignBottomCenter.
	
	self assert: morph listCentering equals: #center.
	self assert: morph wrapCentering equals: #bottomRight