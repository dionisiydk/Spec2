tests
testModifyingDatasetSelection

	| presenter dataset selection |
	dataset := (SpSimpleDataSource on: #(one two three)) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	selection := presenter addSelection: SpManualSelection new.	
	presenter buildIn: ui.
	
	selection selectItemsWith: #(one three).
	
	self assert: presenter view selectedRowIndexes equals: #(1 3)