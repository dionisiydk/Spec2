tests
testChildItemsWithGivenActualObject

	| item dataset childItem found |
	dataset := SpDataset new.
	item := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item' at: 10).
	item dataSourceItem defaultChildren: #(100 200 300).
	item expand.
	
	found := item childItemsWith: #(200).
	self assert: found size equals: 1.
	childItem := found first.
	self assert: childItem class equals: SpDatasetItem.
	self assert: childItem dataSourceItem class equals: SpDataItem.
	self assert: childItem actualItem equals: 200.
	self assert: childItem ownerDataset equals: item childrenDataset