tests
testSuitableForPresenterWhichGrandParentIsKindOfSpecifiedClass

	| presenter parent grandParent |
	grandParent := SpMultiLabelPresenterExample new.
	parent := SpLabelPresenter textual: 'another parent'.
	parent parent: grandParent.
	presenter := SpLabelPresenter forTest.
	presenter parent: parent.
	
	self assert: (uiContext isSuitableFor: presenter)