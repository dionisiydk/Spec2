tests
testCreatesIconPresenter

	| icon |
	icon := presenter children anyOne.
	self assert: icon class equals: SpIconicLabelPresenter.
	self assert: icon model notNil