tests
testRestoresSelectionWhichItemWasRemovedByParentCollapsing
	
	| selection expandedItem |
	selection := presenter addSelection: SpManualSelection new.
	expandedItem := model itemAt: 1.
	expandedItem dataSourceItem defaultChildren: #(a s d).
	presenter rebuild.
	
	expandedItem expand.
	selection selectItemsWith: { model dataSource actualItems second. #s }.
	self assert: selection actualItems equals: {  model dataSource actualItems second. #s  }.

	expandedItem collapse.
	
	self assert: selection actualItems equals: {model dataSource actualItems second}.
	self assert: presenter view selectedItemIndexes equals: #(2)