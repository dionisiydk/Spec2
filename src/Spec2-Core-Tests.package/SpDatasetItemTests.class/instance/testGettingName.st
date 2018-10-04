tests
testGettingName

	| item |
	item := SpDatasetItem of: #dataset item: (SpDataItem of: #actualItem named: 'some item').
	
	self assert: item name equals: 'some item'