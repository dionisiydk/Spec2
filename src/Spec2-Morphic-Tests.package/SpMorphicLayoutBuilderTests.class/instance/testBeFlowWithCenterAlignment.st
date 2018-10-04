tests-flow layout
testBeFlowWithCenterAlignment

	layout beFlow alignCenter.
	
	self assert: morph listCentering equals: #center.
	self assert: morph wrapCentering equals: #center