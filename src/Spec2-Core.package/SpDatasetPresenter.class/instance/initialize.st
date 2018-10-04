initialization
initialize
	super initialize.
	
	columns := { SpItemNameColumn of: self }.
	selections := OrderedCollection new.
	showsColumnHeader := false.
	itemContextClass := SpDatasetContext