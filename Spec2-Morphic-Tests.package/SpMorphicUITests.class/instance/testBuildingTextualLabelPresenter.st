tests-general
testBuildingTextualLabelPresenter

	| presenter |
	presenter := SpLabelPresenter textual: 'test label'.
	
	presenter buildIn: ui.
	
	self assert: presenter view notNil