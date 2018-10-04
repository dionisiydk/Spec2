tests
testResetPresenterStyleWhenItWasNotSet

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	presenter buildIn: ui.
	presenter applyStyle: #specialStyle.
	
	presenter resetStyle.
	
	self assert: presenter currentStyle isNil.
	self assert: presenter mainStyle isNil.
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #defaultLabel