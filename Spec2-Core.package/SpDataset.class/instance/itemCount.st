queries
itemCount
	^dataSource itemCount
		+ (expandedItems detectSum: [ :each | each childrenCount ])