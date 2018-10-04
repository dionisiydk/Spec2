tests-dataset
testBuildingDatasetPresenterWithManualSelection

	| presenter dataset selection |
	dataset := (SpSimpleDataSource on: #(one two three)) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection multiple.
	selection selectItemsWith: #(one three).
	
	presenter buildIn: ui.
	
	self assert: presenter view selectedRowIndexes equals: #(1 3).
	self assert: presenter view isMultipleSelection