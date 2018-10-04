tests
testAddNewItem
	
	selection selectItemsAt: #(1).
	
	selection addNewItem: (dataset itemAt: 3).
	
	self assert: selection size equals: 2.
	self assert: selection actualItems equals: { dataset actualItems first. dataset actualItems third }