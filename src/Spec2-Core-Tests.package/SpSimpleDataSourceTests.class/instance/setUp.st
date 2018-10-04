running
setUp
	super setUp.
	
	actualItems := #(1 2 3).
	dataSource := SpSimpleDataSource on: actualItems.