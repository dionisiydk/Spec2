tests-dataset
testRestoreDatasetSelectionAfterItemExpansion

	| presenter dataset expandedItem selection |
	dataset := (SpSimpleDataSource on: #(1 2 3)) asSpecDataset.
	expandedItem := (dataset itemAt: 1).
	expandedItem dataSourceItem defaultChildren: #(a s c).
	presenter := SpDatasetPresenter on: dataset.	
	selection := presenter addSelection: SpManualSelection new.
	presenter buildIn: ui.
	selection selectItemsWith: { 2 }.
	
	expandedItem expand.

	self assert: presenter view selectedRowIndexes equals: #(5).	
	self assert: selection actualItems equals: #(2).
