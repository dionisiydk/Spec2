running
setUp
	super setUp.
	
	dataset := (SpSimpleDataSource on: #(1 2 3)) asSpecDataset.
	selection := SpDatasetSelection new.
	selection rootDataset: dataset.
	