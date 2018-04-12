initialization
initialize
	super initialize.
	
	restriction := SpAnyValueRestriction default.
	displayDecoration := SpNoTextDecoration default.
	isReadOnly := self isAlwaysReadOnly.
	isOptional := false.
	emptyValues := #(nil)