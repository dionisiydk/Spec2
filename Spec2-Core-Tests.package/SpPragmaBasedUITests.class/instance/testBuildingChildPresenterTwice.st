tests
testBuildingChildPresenterTwice

	| presenter child childView |
	presenter := SpMultiLabelPresenterExample new.
	presenter ui: ui.
	
	child := SpLabelPresenter textual: 'test label'.
	presenter buildChild: child.
	childView := child view.	
	presenter buildChild: child.
	
	self assert: child view == childView