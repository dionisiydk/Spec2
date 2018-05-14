tests
testCreatesOptionsPresenter

	self assert: presenter optionsPresenter class equals: SpDatasetPresenter.
	self assert: presenter optionsPresenter model equals: presenter optionsDataset