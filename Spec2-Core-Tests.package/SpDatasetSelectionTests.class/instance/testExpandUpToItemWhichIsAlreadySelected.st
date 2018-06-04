tests
testExpandUpToItemWhichIsAlreadySelected
	
	selection selectItemsAt: #(1 2 3 4).
	
	selection expandUpToItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 4.
	self assert: selection actualItems equals: #(1 4 3 2)