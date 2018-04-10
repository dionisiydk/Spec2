accessing
rawValue: aString
	super rawValue: aString.
	
	baseValueHolder value: (stringConverter parseValueFromString: aString)