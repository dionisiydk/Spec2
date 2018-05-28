queries
itemsWith: actualObjects 
	| myItems childItems |
	myItems := (dataSource itemsWith: actualObjects)
		select: [ :each | each notNil ] "missing items are returned as nil"
		thenCollect: [ :each | SpDatasetItem of: self item: each ].
		
	myItems size == actualObjects size ifTrue: [ ^myItems ].
	
	childItems := expandedItems flatCollect: [ :each | each childItemsWith: actualObjects].
	
	^myItems, childItems