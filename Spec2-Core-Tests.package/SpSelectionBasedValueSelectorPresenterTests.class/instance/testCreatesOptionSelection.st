tests
testCreatesOptionSelection

	self assert: presenter optionSelection class equals: SpManualSelection.
	self assert: presenter optionSelection rootDataset equals: optionDataset.
	self assert: presenter optionSelection strategy == presenter selectionStrategy