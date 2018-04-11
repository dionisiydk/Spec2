tests
testHasInfiniteBoundsByDefault
	
	self assert: restriction minValue equals: Float negativeInfinity.
	self assert: restriction maxValue equals: Float infinity.