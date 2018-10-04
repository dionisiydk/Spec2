tests
testItemsExtendingContextOfSelectedItem
	
	| selectedItems |
	selection selectItemsAt: #(1 2 3).
	
	selectedItems := selection itemsExtendingContextOf: (dataset itemAt: 2).
	
	self 
		assert: selectedItems 
		equals: {selection items first. selection items third. selection items second}