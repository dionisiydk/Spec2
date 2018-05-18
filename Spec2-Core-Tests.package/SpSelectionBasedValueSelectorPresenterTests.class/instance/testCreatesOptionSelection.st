tests
testCreatesOptionSelection

	self assert: presenter optionSelection class equals: SpManualSelection.
	self assert: presenter optionSelection rootDataset equals: presenter optionDataset.
	self assert: presenter optionSelection isSingle