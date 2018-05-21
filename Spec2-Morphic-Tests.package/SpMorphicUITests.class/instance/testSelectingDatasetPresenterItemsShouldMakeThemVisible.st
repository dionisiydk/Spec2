tests
testSelectingDatasetPresenterItemsShouldMakeThemVisible

	| presenter dataset selection lastBuiltRow |
	dataset := (SpSimpleDataSource on: (1 to: 1000) asArray) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection new.
	presenter buildIn: ui.

	selection selectItemsWith: #(1000).
	presenter view forceRowsUpdate. "Normally table morphs updates during draw cicle"
	
	lastBuiltRow := presenter view builtRowViews last.
	self assert: (lastBuiltRow cellViewAt: 1) specPresenter model value actualItem equals: 1000