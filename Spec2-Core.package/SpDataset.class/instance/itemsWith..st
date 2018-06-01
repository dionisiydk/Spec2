queries
itemsWith: actualObjects 
	| myItems childItems |
	myItems := self localItemsWith: actualObjects.
		
	myItems size == actualObjects size ifTrue: [ ^myItems ].
	
	childItems := expandedItems flatCollect: [ :each | each childItemsWith: actualObjects].
	
	^myItems, childItems