tests
testCreatesSingleValueSelectorPresenter

	| selectorPresenter |
	selectorPresenter := presenter selectorPresenter.
	self assert: selectorPresenter class equals: SpSingleValueSelectorPresenter.
	self assert: selectorPresenter model equals: model.
	self assert: selectorPresenter optionsDataset equals: presenter optionsDataset.