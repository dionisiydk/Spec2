initialization
initialize
	super initialize.
	
	depth := 0.
	expandedItems := SortedCollection sortBlock: #dataSourceIndex ascending.
	dirty := false