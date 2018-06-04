tests
testDeselectSingleItem
	
	selection selectItemsAt: #(1 2).
	
	selection deselectItem: (dataset itemAt: 2).
	
	self assert: selection size equals: 1.
	self assert: selection actualItems equals: { dataset actualItems first }