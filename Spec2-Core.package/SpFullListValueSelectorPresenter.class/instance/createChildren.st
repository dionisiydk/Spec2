initialization
createChildren
	optionPresenter := SpDatasetPresenter on: optionDataset.
	optionSelection := optionPresenter addSelection: (SpManualSelection withStrategy: selectionStrategy)