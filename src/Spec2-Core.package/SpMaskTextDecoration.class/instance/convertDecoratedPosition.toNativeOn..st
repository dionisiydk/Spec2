operations
convertDecoratedPosition: index toNativeOn: decoratedString 
	| result lastMaskValue |
	index = 0 ifTrue: [ ^0 ].
	result := 0.
	mask withIndexDo: [:each :i | 
		i <= index & (each = asterix) ifTrue: [ 
			result := result + 1.
			i = index ifTrue: [ ^result ] ].
		i > index & (each = asterix) ifTrue: [ ^result + (lastMaskValue ~= asterix) asBit].
		lastMaskValue := each.
	].
	^result
