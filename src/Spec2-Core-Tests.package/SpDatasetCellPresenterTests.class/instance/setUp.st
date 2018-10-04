running
setUp
	
	dataset := (SpSimpleDataSource on: #(1 2 3)) asSpecDataset.
	datasetPresenter := SpDatasetPresenter on: dataset.
	 
	super setUp.
	
	