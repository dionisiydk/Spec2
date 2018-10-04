operations
convertDecoratedTextToNative: aString 
	| maskStream nextMaskChar decoratedStream nextInputChar |	
	maskStream := mask readStream.
	decoratedStream := aString readStream.

	^String new: mask size streamContents: [ :out | 	
		[maskStream atEnd or:[decoratedStream atEnd]] whileFalse: [
			nextMaskChar := maskStream next.
			nextInputChar := decoratedStream next.			
			nextMaskChar = asterix
				ifTrue: [	out nextPut: nextInputChar]]
	].