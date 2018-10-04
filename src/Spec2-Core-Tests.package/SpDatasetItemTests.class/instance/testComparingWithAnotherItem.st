tests
testComparingWithAnotherItem

	| item anotherItem |
	item := SpDatasetItem of: #dataset item: (SpDataItem of: #actualItem named: 'some item').
	
	self assert: (item isEqualTo: item).
	anotherItem := SpDatasetItem of: #dataset item: (SpDataItem of: #actualItem named: 'some item').
	self assert: (item isEqualTo: anotherItem).
	
	anotherItem := SpDatasetItem of: #dataset item: (SpDataItem of: #actualItem2 named: 'some item').
	self deny: (item isEqualTo: anotherItem).