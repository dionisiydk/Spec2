initialization
initialize
	super initialize.
	
	depth := 0.
	expandedItems := OrderedCollection new.
	dirty := false