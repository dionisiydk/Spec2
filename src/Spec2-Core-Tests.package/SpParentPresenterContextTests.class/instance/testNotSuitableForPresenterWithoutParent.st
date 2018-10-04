tests
testNotSuitableForPresenterWithoutParent

	| presenter |
	presenter := SpLabelPresenter forTest.
	self assert: presenter parent isNil.
	
	self deny: (uiContext isSuitableFor: presenter)