tests
testConvertingItemsToSelectionModel
	
	| actualValue |
	
	actualValue := selectionStrategy convertItemsToSelectionModel: #(10).
	
	self assert: actualValue equals: #(10)