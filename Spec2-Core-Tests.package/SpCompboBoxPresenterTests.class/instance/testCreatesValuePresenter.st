tests
testCreatesValuePresenter

	| valuePresenter valueModel |
	valuePresenter := presenter valuePresenter.
	self assert: valuePresenter class equals: SpTextInputPresenter.
	self assert: valuePresenter textDecoration equals: model aspect displayDecoration.
	valueModel := valuePresenter model.
	self assert: valueModel class equals: SpPrintedValueHolder.
	self assert: valueModel baseValueHolder equals: model.
	self assert: valueModel stringConverter equals: model aspect stringConverter.