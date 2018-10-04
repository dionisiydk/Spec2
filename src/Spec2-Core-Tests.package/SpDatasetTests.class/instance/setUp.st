running
setUp
	super setUp.
	
	dataSource := SpSimpleDataSource on: #(1 2 3).
	dataset := SpDataset from: dataSource.