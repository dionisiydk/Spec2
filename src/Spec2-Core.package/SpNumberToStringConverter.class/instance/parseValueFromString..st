operations
parseValueFromString: aString
	| digitCount separatorCount normalizedString signed |
	aString ifEmpty: [ ^nil ].
	normalizedString := self normalizeNumericString: aString.
	signed := normalizedString first = $-.
	digitCount := 0.
	separatorCount := 0.
	normalizedString do: [ :char | 
		char isDigit 
			ifTrue: [ digitCount := digitCount + 1 ]
			ifFalse: [ (decimalSeparators includes: char) 
				ifTrue: [separatorCount := separatorCount + 1]]
	].
	digitCount + (separatorCount min: 1) + signed asBit = normalizedString size 
		ifFalse: [ SpBadStringFormat signal ].
	^normalizedString asNumber