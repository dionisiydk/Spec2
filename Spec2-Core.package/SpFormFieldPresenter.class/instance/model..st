accessing
model: anObject
	super model: anObject.
	
	model isValid ifFalse: [ currentStyle := #invalid ]