tests
testUpdatingDatasetSelectionByUIEvent

	| presenter dataset selection |
	dataset := (SpSimpleDataSource on: #(one two three)) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection new.	
	presenter buildIn: ui.
	
	presenter view selectRowIndexes: #(1 3).
		
	self assert: selection actualItems equals: #(one three)