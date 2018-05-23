tests
testDoesNotCreateExpansionButtonWhenColumnIsNotExpandable
	
	self deny: presenter column isExpandable.
	model dataSourceItem defaultChildren: #(4 5 6).	
	presenter rebuild.
	
	self deny: (presenter children anySatisfy: [ :each | each class = SpCommandPresenter ])