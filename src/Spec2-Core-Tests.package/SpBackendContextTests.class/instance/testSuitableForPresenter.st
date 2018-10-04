tests
testSuitableForPresenter

	| presenter |
	presenter := SpLabelPresenter forTest.
	
	presenter ui: uiContext uiClass new.
	self assert: (uiContext isSuitableFor: presenter).
	
	presenter ui: #anotherUI.
	self deny: (uiContext isSuitableFor: presenter).