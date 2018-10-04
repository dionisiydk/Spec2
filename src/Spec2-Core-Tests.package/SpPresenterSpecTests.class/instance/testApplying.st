tests
testApplying

	| label |
	label := SpLabelPresenter forTest.
	spec := SpPresenterSpec createFromMethod: label class >> #setUpDefaultStubView.
	
	spec applyTo: label.
	
	self assert: label view class equals: SpLabelViewStub.
	self assert: label view name equals: #defaultLabel.