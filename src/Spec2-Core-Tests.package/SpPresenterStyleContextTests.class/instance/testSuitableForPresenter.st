tests
testSuitableForPresenter

	| presenter |
	presenter := SpLabelPresenter forTest.
	self assert: presenter currentStyle isNil.
	self deny: (uiContext isSuitableFor: presenter).
	
	presenter currentStyle: #someAnotherStyle.
	self deny: (uiContext isSuitableFor: presenter).
	
	presenter currentStyle: uiContext presenterStyle.
	self assert: (uiContext isSuitableFor: presenter)