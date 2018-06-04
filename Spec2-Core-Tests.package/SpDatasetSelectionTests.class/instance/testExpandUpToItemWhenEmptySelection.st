tests
testExpandUpToItemWhenEmptySelection
	
	selection reset.
	
	selection expandUpToItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 1.
	self assert: selection actualItems equals: #(2)