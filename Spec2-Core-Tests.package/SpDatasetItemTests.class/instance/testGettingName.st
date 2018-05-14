tests
testGettingName

	| item |
	item := SpDatasetItem of: #dataset item: (SpDataItem of: #actualitem named: 'some item').
	
	self assert: item name equals: 'some item'