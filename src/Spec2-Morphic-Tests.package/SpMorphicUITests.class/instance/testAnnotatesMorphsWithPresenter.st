tests-general
testAnnotatesMorphsWithPresenter

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	
	presenter buildIn: ui.
	
	self assert: presenter view specPresenter equals: presenter.
	self assert: (presenter view externalName includesSubstring: presenter printString)