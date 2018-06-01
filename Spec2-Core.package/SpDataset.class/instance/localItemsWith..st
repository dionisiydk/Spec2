queries
localItemsWith: actualObjects 
	^(dataSource itemsWith: actualObjects)
		select: [ :each | each notNil ] "missing items are returned as nil"
		thenCollect: [ :each | SpDatasetItem of: self item: each ]