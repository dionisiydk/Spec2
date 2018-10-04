tests
testToggleItemWhenItIsNotSelected
	
	selection selectItemsWith: #(1 3).
	
	selection toggleItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 3.
	self assert: selection actualItems equals: #(1 3 2)