accessing
rawValue: aString
	| parsedValue |
	super rawValue: aString.
	
	parsedValue := [ stringConverter parseValueFromString: aString ] on: Error do: [ :err | 
		SpInvalidValue with: aString ].
	
	baseValueHolder value: parsedValue