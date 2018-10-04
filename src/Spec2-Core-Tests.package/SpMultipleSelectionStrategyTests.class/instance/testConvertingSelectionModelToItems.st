tests
testConvertingSelectionModelToItems
	
	| items |
	
	items := selectionStrategy convertSelectionModelToItems: #(10).
	
	self assert: items equals: #(10)