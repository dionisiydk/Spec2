initialization
initialize
	super initialize.
	
	allowsAutoAcceptValues := false.
	restriction := SpAnyValueRestriction default.
	displayDecoration := SpNoTextDecoration default.
	isReadOnly := self isAlwaysReadOnly.
	isOptional := false.
	emptyValues := #(nil)