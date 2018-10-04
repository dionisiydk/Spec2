tests-flow layout
testBeFlowWithTopCenterAlignment

	layout beFlow alignTopCenter.
	
	self assert: morph listCentering equals: #center.
	self assert: morph wrapCentering equals: #topLeft