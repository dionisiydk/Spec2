initialization
initialize
	super initialize.
	
	depth := 0.
	expandedItems := SortedCollection sortBlock: #index ascending.
	dirty := false