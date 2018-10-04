tests
testBuildingPresenter

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #defaultLabel