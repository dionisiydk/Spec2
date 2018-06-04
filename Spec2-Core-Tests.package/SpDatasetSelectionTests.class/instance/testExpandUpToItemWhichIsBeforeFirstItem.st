tests
testExpandUpToItemWhichIsBeforeFirstItem
	
	selection selectItemsAt: #(6 4).
	
	selection expandUpToItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 4.
	self assert: selection actualItems equals: #(6 4 3 2)