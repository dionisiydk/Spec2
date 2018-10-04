testing
matchesString: aString

	| activeSeparator decimalPart |
	aString ifEmpty: [ ^true ].
	decimalDigitsCount = 0 ifTrue: [ ^aString isAllDigits ].
	
	activeSeparator := aString detect: [ :each | decimalSeparators includes: each ] ifNone: [ 
		^aString isAllDigits ].
	
	(aString occurrencesOf:  activeSeparator) > 1 ifTrue: [ ^false ].
	
	(aString allSatisfy: [ :each | each = activeSeparator or: [each isDigit]  ])
		ifFalse: [ ^false].
		
	decimalPart := aString readStream upTo: activeSeparator; upToEnd.
	^decimalPart size <= decimalDigitsCount 