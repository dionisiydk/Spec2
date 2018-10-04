tests
testStylingPresenter

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	presenter buildIn: ui.

	presenter applyStyle: #specialStyle.
	
	self assert: presenter currentStyle equals: #specialStyle.
	self assert: presenter mainStyle isNil.
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #specialLabel