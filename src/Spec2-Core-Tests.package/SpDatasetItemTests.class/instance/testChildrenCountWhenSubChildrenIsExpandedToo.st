tests
testChildrenCountWhenSubChildrenIsExpandedToo

	| item dataset expandedChild |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	item dataSourceItem defaultChildren: #(1 2 3).
	item expand.
	
	expandedChild := item childrenDataset itemAt: 2.
	expandedChild dataSourceItem defaultChildren: #(4 5).
	expandedChild expand.
		
	self assert: item childrenCount equals: 5