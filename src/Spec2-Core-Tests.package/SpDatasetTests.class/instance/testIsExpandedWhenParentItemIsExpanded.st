tests
testIsExpandedWhenParentItemIsExpanded

	| parentItem childrenDataset |
	parentItem := dataset itemAt: 1.
	parentItem dataSourceItem defaultChildren: #(a b c).
	
	parentItem expand.
	childrenDataset := parentItem childrenDataset.
	self assert: childrenDataset isExpanded.
	
	parentItem collapse.
	self deny: childrenDataset isExpanded