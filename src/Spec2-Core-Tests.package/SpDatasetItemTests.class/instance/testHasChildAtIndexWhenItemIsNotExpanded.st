tests
testHasChildAtIndexWhenItemIsNotExpanded

	| item dataset |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').

	self deny: (item hasChildAt: #anyValue)