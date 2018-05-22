tests
testChildrenItemAtIndex

	| item dataset childItem |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 10).
	item dataSourceItem defaultChildren: #(100 200 300).
	item expand.
	
	childItem := item childItemAt: 11.
	self assert: childItem class equals: SpDatasetItem.
	self assert: childItem dataSourceItem class equals: SpDataItem.
	self assert: childItem actualItem equals: 100.
	self assert: childItem ownerDataset equals: item childrenDataset