tests
testGettingIndex

	| item dataItem |
	dataItem := SpDataItem of: #actualitem named: 'some item'.
	dataItem index: 40.
	
	item := SpDatasetItem of: #dataset item: dataItem.
	
	self assert: item index equals: 40