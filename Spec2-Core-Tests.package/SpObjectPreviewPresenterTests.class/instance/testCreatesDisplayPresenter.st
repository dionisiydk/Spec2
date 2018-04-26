tests
testCreatesDisplayPresenter

	| actual |
	actual := presenter children detect: [ :each | each class = SpTextInputPresenter ].
	
	self assert: actual model baseValueHolder equals: model