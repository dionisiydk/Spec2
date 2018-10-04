tests
testStylingCompositePresenterShouldReinitializeChildren

	| presenter originalChildren |
	presenter := SpMultiLabelPresenterExample new.
	presenter buildIn: ui.
	originalChildren := presenter children.
	self assert: originalChildren size equals: 2.
	
	presenter applyStyle: #singleLabel.
	
	self assert: presenter children size equals: 1