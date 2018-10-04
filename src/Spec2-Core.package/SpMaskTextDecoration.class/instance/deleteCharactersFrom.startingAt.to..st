operations
deleteCharactersFrom: decoratedString startingAt: startIndex to: stopIndex
	
	| maskStream decoratedStream nextChar nextMaskChar |
	maskStream := mask readStream.
	decoratedStream := decoratedString readStream.
	
	^String new: mask size streamContents: [ :out | 	
		[maskStream atEnd or:[decoratedStream atEnd]] whileFalse: [
			nextChar := decoratedStream next.			
			nextMaskChar := maskStream next.
			(decoratedStream position between: startIndex and: stopIndex) ifTrue: [ 
				nextMaskChar = asterix ifTrue: [ nextChar := asterix ]].
			out nextPut: nextChar ].
		[ decoratedStream atEnd ] whileFalse: [ 
			out nextPut: decoratedStream next.
			maskStream next ].
		[ maskStream atEnd ] whileFalse: [ out nextPut: maskStream next ]
	]