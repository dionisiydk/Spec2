tests
testSuitableForPresenterWhichSatisfiesAllContexts

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #someStyle.
	
	spec addContext: (SpPresenterStyleContext style: #someStyle).
	
	self assert: (spec isSuitableFor: presenter)