tests
testSuitableForAnyPresenterWhenContextsAreNotSpecified

	self assert: spec contexts isEmpty.
	
	self assert: (spec isSuitableFor: #anyPresenter)