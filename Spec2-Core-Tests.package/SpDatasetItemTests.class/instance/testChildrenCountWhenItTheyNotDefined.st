tests
testChildrenCountWhenItTheyNotDefined

	| item |
	item := SpDatasetItem of: #dataset item: (SpDataItem of: #actualitem named: 'some item').
	
	self assert: item childrenCount equals: 0