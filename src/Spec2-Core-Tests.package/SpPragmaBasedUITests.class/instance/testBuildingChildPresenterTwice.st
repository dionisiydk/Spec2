tests
testBuildingChildPresenterTwice

	| presenter child childView |
	presenter := SpMultiLabelPresenterExample new.
	presenter ui: ui.
	
	child := SpLabelPresenter textual: 'test label'.
	presenter buildChild: child.
	childView := child view.	
	presenter buildChild: child.
	
	self assert: child view == childView.
	self assert: (presenter children includes: child).
	self assert: presenter children size equals: 1