tests
testItemsExtendingContextOfLastItem
	
	| selectedItems |
	selection selectItemsAt: #(1 2).
	
	selectedItems := selection itemsExtendingContextOf: (dataset itemAt: 2).
	
	self assert: selectedItems equals: selection items