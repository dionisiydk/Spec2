accessing
model: anObject
	super model: anObject asValueHolder.
	
	model isValid ifFalse: [ currentStyle := #invalid ]