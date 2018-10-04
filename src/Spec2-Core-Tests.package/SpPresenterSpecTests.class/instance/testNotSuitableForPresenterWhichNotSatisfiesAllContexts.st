tests
testNotSuitableForPresenterWhichNotSatisfiesAllContexts

	| presenter |
	presenter := SpLabelPresenter textual: 'test label' withStyle: #someStyle.
	
	spec addContext: (SpPresenterStyleContext style: #someStyle).
	spec backendUI: #someUIClass.
	
	self deny: (spec isSuitableFor: presenter)