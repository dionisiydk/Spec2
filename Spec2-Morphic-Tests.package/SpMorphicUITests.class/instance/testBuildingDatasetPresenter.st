tests-dataset
testBuildingDatasetPresenter

	| presenter dataset |
	dataset := (SpSimpleDataSource on: #(1 2 3)) asSpecDataset.
	presenter := SpDatasetPresenter on: dataset.
	
	presenter buildIn: ui.
	
	self assert: presenter view class equals: SpDatasetMorph.
	self assert: presenter view dataSource class equals: SpTableMorphDataSourceAdapter.
	self assert: presenter view dataSource dataset equals: dataset.