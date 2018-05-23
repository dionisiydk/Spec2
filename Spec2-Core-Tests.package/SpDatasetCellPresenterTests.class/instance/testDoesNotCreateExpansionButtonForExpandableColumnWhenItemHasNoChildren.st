tests
testDoesNotCreateExpansionButtonForExpandableColumnWhenItemHasNoChildren
	
	presenter column beExpandable.
	self assert: presenter column isExpandable.
	self deny: model isExpandable.
	presenter rebuild.
	
	self deny: (presenter children anySatisfy: [ :each | each class = SpCommandPresenter ])