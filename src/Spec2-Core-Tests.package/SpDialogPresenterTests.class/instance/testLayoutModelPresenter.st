tests
testLayoutModelPresenter

	self assert: (presenter children includes: presenter model).
	self assert: presenter model view notNil