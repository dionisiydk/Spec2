tests
testRebuildingCompositePresenterShouldReinitializeChildren

	| presenter originalChildren |
	presenter := SpMultiLabelPresenterExample new.
	presenter buildIn: ui.
	originalChildren := presenter children.
	self assert: originalChildren size equals: 2.
	
	presenter currentStyle: #singleLabel. "to ensure single children after rebuild"
	presenter rebuild.
	
	self assert: presenter children size equals: 1