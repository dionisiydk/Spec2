tests
testSuitableForPresenterWhichParentIsKindOfSpecifiedClass

	| presenter parent |
	parent := SpMultiLabelPresenterExample new.
	presenter := SpLabelPresenter forTest.
	presenter parent: parent.
	
	self assert: (uiContext isSuitableFor: presenter)