tests
testIsExpandable

	| item |
	item := SpDatasetItem of: #dataset item: 10 asDataItem.
	self deny: item isExpandable.
	
	item dataSourceItem defaultChildren: #().
	self deny: item isExpandable.
	
	item dataSourceItem defaultChildren: #(2).
	self assert: item isExpandable.