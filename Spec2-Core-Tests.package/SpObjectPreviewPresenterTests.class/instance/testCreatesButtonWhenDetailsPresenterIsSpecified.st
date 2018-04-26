tests
testCreatesButtonWhenDetailsPresenterIsSpecified

	| actual |
	presenter detailsPresenter: SpPointFormPresenterExample new.
	presenter rebuild.
	
	actual := presenter children detect: [ :each | each class = SpCommandPresenter ].
	
	self assert: actual model name equals: '...'