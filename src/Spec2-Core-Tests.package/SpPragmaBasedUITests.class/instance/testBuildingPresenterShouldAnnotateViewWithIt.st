tests
testBuildingPresenterShouldAnnotateViewWithIt

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	presenter buildIn: ui.
	
	self assert: presenter view specPresenter equals: presenter