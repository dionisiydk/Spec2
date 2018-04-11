operations
convertNativePosition: index toDecoratedOn: aString
	
	| nativeIndex |
	
	index = 0 ifTrue: [ ^index ].
	
	nativeIndex := 0.
	1 to: aString size do: [ :i |
		(thousandsSeparator includes: (aString at: i)) ifFalse: [ 
			nativeIndex := nativeIndex + 1.
		 ].
		nativeIndex >= index ifTrue: [ ^i ]].
	
	^aString size