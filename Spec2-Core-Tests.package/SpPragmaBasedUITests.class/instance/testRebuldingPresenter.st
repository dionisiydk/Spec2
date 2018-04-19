tests
testRebuldingPresenter

	| presenter currentView |
	presenter := SpLabelPresenter textual: 'test label'.
	presenter buildIn: ui.
	currentView := presenter view.
	
	presenter rebuild.
	
	self deny: presenter view = currentView.
	self assert: presenter view class equals: SpLabelViewStub