tests
testResetModifiedPresenterStyle

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #existingStyle.
	presenter buildIn: ui.
	presenter applyStyle: #specialStyle.
	
	presenter resetStyle.
	
	self assert: presenter currentStyle equals: #existingStyle.
	self assert: presenter mainStyle equals: #existingStyle.
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #defaultLabel