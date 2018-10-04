tests-dataset
testBuildingDatasetPresenterWithSingleSelection

	| presenter dataset selection |
	dataset := (SpSimpleDataSource on: #(one two three)) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection single.
	selection selectItemsWith: #(one).
	
	presenter buildIn: ui.
	
	self assert: presenter view selectedRowIndexes equals: #(1).
	self deny: presenter view isMultipleSelection