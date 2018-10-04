layout strategies
proportion
	self assertProportionalLayout.
	
	^morph layoutFrame ifNil: [
		morph layoutFrame: LayoutFrame identity.
		morph hResizing: #spaceFill; vResizing: #spaceFill.
		morph layoutFrame]