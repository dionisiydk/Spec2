tests
testToggleItemWhenItIsSelected
	
	selection selectItemsWith: #(1 2 3).
	
	selection toggleItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 2.
	self assert: selection actualItems equals: #(1 3)