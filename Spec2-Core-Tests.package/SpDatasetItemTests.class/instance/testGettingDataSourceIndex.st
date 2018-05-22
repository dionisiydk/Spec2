tests
testGettingDataSourceIndex

	| item dataItem |
	dataItem := SpDataItem of: #actualItem named: 'some item'.
	dataItem index: 40.
	
	item := SpDatasetItem of: #dataset item: dataItem.
	
	self assert: item dataSourceIndex equals: 40