running
setUp
	super setUp.
	
	dataset := (SpSimpleDataSource on: #(1 2 3 4 5 6)) asSpecDataset.
	selection := SpDatasetSelection new.
	selection rootDataset: dataset.
	