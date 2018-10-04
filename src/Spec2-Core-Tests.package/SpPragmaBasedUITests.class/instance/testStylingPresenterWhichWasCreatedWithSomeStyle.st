tests
testStylingPresenterWhichWasCreatedWithSomeStyle

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #existingStyle.
	presenter buildIn: ui.

	presenter applyStyle: #specialStyle.
	
	self assert: presenter currentStyle equals: #specialStyle.
	self assert: presenter mainStyle equals: #existingStyle.
	self assert: presenter view class equals: SpLabelViewStub.
	self assert: presenter view name equals: #specialLabel