operations
convertNativePosition: index toDecoratedOn: decoratedString 
	| nativeCounter |
	nativeCounter := 0.
	mask withIndexDo: [:each :i |  
		(each = asterix) ifTrue: [ nativeCounter := nativeCounter + 1 ].
		nativeCounter = index ifTrue: [ ^i ]
	].
	^mask size