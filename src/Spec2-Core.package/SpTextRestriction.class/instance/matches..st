testing
matches: anObject
	^(anObject isKindOf: String) and: [ self matchesString: anObject ]