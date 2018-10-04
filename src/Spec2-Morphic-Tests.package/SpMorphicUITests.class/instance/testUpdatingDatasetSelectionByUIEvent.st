tests-dataset
testUpdatingDatasetSelectionByUIEvent

	| presenter dataset selection |
	dataset := (SpSimpleDataSource on: #(one two three four)) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection new.	
	presenter buildIn: ui.
	
	presenter view selectRowIndexes: #(1 3 4).
		
	self assert: selection actualItems equals: #(four three one) "fast table use reversed selection order. But we want natural ordering. So last item in selection should be really last item which user selects"