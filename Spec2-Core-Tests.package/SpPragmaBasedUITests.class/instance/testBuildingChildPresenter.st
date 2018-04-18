tests
testBuildingChildPresenter

	| presenter child |
	presenter := SpMultiLabelPresenterExample new.
	presenter ui: ui.
	
	child := SpLabelPresenter textual: 'test label'.
	presenter buildChild: child.
	
	self assert: child view class equals: SpLabelViewStub.
	self assert: child view name equals: #defaultLabel.
	self assert: child ui equals: ui.
	self assert: child parent equals: presenter.
	self assert: (presenter children includes: child).