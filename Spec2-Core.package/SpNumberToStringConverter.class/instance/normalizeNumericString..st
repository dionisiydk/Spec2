operations
normalizeNumericString: aString
	| result signed |
	result := aString copyReplaceAll: ',' with: '.'.
	signed := aString first = $-.
	signed ifTrue: [ result := result allButFirst ].
	
	(decimalSeparators includes: result first) ifTrue: [ result := '0', result ].
	^signed 
		ifTrue: [ '-', result ]
		ifFalse: [result]