tests
testAddsValueSelectorColumn

	| firstColumn |
	firstColumn := presenter optionPresenter columns first.
	
	self assert: firstColumn class equals: SpValueSelectorColumn.
	self assert: firstColumn affectedModel equals: model.
	self assert: firstColumn selectionStrategy == presenter selectionStrategy