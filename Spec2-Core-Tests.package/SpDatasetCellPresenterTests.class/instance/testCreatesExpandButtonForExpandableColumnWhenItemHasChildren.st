tests
testCreatesExpandButtonForExpandableColumnWhenItemHasChildren
	
	| button |
	presenter column beExpandable.
	self assert: presenter column isExpandable.
	model dataSourceItem defaultChildren: #(4 5 6).
	presenter rebuild.
	
	button := presenter children detect: [ :each | each class = SpCommandPresenter ].
	self assert: button command class equals: SpExpandDatasetCommand.
	self assert: button command datasetItem equals: model.
	self assert: button currentStyle equals: #iconicButton.