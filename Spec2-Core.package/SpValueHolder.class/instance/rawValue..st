accessing
rawValue: aValue
	super rawValue: aValue.
	
	(aspect isValueValid: aValue)
		ifTrue: [ self submitValue]