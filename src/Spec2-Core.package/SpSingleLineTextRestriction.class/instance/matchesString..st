testing
matchesString: aString
	^(aString includesAny: { Character cr. Character lf }) not