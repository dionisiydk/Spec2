tests
testRestoresSelectionsWhenItemWasExpanded
	
	| selection expandedItem selectedItem |
	selection := presenter addSelection: SpManualSelection new.
	selection selectItemsWith: { model dataSource actualItems second }.
	expandedItem := model itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(a s d).
	presenter rebuild.
	
	expandedItem expand.
	
	selectedItem := selection items first.
	self assert: selectedItem globalIndex equals: 5.
	self assert: presenter view selectedItemIndexes equals: #(5)