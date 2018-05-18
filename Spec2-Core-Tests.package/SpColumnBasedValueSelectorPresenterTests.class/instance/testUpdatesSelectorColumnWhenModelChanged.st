tests
testUpdatesSelectorColumnWhenModelChanged

	| selectorColumn cells enabledCells |
	
	model value: optionDataset actualItems second.
	
	selectorColumn := presenter optionPresenter columns first.
	cells := presenter cellsForColumn: selectorColumn.	
	enabledCells := cells select: [ :each | each model value ].
	self assert: enabledCells size equals: 1.
	self assert: cells second equals: enabledCells first.