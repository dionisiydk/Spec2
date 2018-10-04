tests-flow layout
testBeFlowWithCenterRightAlignment

	layout beFlow alignCenterRight.
	
	self assert: morph listCentering equals: #bottomRight.
	self assert: morph wrapCentering equals: #center