tests
testCreatesExpansionButtonForExpandableColumnWhenItemHasChildren
	
	| button |
	presenter column beExpandable.
	self assert: presenter column isExpandable.
	model dataSourceItem defaultChildren: #(4 5 6).
	presenter rebuild.
	
	button := presenter children detect: [ :each | each class = SpCommandPresenter ].
	button executeCommand.
	
	self assert: model isExpanded