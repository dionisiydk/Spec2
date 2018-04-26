tests
testDoesNotCreatesButtonWhenNoDetailsPresenterIsSpecified

	self deny: (presenter children anySatisfy: [ :each | each class = SpCommandPresenter ])
	