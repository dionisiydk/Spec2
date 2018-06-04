tests
testExpandUpToItemWhichIsAfterLastItem
	
	selection selectItemsAt: #(1 3).
	
	selection expandUpToItem: (dataset itemAt: 5).
	
	self assert: selection size equals: 4.
	self assert: selection actualItems equals: #(1 3 4 5)