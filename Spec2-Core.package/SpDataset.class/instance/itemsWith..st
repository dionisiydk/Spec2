queries
itemsWith: actualObjects 
	^(dataSource itemsWith: actualObjects)
		collect: [ :each | SpDatasetItem of: self item: each ]