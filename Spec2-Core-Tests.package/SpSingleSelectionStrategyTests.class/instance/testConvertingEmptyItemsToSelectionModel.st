tests
testConvertingEmptyItemsToSelectionModel
	
	| actualValue |
	
	actualValue := selectionStrategy convertItemsToSelectionModel: #().
	
	self assert: actualValue equals: nil