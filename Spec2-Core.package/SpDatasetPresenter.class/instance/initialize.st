initialization
initialize
	super initialize.
	
	columns := { SpMainDatasetColumn of: self }.
	selections := OrderedCollection new.