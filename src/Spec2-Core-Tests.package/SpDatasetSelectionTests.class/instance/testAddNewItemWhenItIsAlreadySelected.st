tests
testAddNewItemWhenItIsAlreadySelected
	
	selection selectItemsAt: #(1).
	
	self should: [selection addNewItem: (dataset itemAt: 1)] raise: Error