tests
testCreatesOptionPresenter

	self assert: presenter optionPresenter class equals: SpDatasetPresenter.
	self assert: presenter optionPresenter model equals: presenter optionDataset