testing
isValueValid: aValue
	(isOptional and: [ emptyValues includes: aValue ]) 
		ifTrue: [ ^true ].
	
	^restriction matches: aValue