operations
overrideCharactersFrom: decoratedString by: newString startingAt: startIndex
	| maskStream decoratedStream newStream nextChar nextMaskChar |
	maskStream := mask readStream.
	decoratedStream := decoratedString readStream.
	newStream := newString readStream.

	^String new: mask size streamContents: [ :out | 	
		[maskStream atEnd or:[decoratedStream atEnd]] whileFalse: [
			nextChar := decoratedStream next.			
			nextMaskChar := maskStream next.
			decoratedStream position >= startIndex ifTrue: [ 
				nextMaskChar = asterix & newStream atEnd not ifTrue: [ 
					nextChar := newStream next ]].
			out nextPut: nextChar ].
		[ decoratedStream atEnd ] whileFalse: [ out nextPut: decoratedStream next ]
	]