tests
testIsRemovedWhenParentWasCollapsed

	| dataset parentItem childItem |
	dataset := SpDataset new.
	parentItem := SpDatasetItem of: dataset item: (SpDataItem of: #actualItem named: 'some item').
	parentItem dataSourceItem defaultChildren: #(1 2 3).	
	parentItem expand.
	
	childItem := parentItem childrenDataset itemAt: 2.
	self assert: childItem actualItem equals: 2.
	self deny: childItem isRemoved.

	parentItem collapse.
	self assert: childItem isRemoved.