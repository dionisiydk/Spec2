tests
testGettingItemByIndex

	| item |
	item := dataset itemAt: 2.
	
	self assert: item class equals: SpDatasetItem.
	self assert: item dataSourceItem class equals: SpDataItem.
	self assert: item actualItem equals: (dataSource actualItems at: 2).
	self assert: item ownerDataset equals: dataset