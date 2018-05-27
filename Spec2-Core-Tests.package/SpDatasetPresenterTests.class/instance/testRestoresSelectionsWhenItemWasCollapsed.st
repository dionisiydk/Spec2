tests
testRestoresSelectionsWhenItemWasCollapsed
	
	| selection expandedItem selectedItem |
	selection := presenter addSelection: SpManualSelection new.
	selection selectItemsWith: { model dataSource actualItems second }.
	expandedItem := model itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(a s d).
	presenter rebuild.
	
	expandedItem expand.
	expandedItem collapse.
	
	selectedItem := selection items first.
	self assert: selectedItem globalIndex equals: 2.
	self assert: presenter view selectedItemIndexes equals: #(2)