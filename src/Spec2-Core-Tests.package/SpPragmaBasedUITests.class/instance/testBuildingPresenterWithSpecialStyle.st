tests
testBuildingPresenterWithSpecialStyle

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #specialStyle.
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #specialLabel