tests-flow layout
testBeFlowWithBottomRightAlignment

	layout beFlow alignBottomRight.
	
	self assert: morph listCentering equals: #bottomRight.
	self assert: morph wrapCentering equals: #bottomRight