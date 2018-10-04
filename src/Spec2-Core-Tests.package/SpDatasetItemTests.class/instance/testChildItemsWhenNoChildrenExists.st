tests
testChildItemsWhenNoChildrenExists

	| item dataset found |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 10).
	
	found := item childItemsWith: #(200).
	self assert: found isEmpty
