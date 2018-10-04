operations
convertNativeTextToDecorated: aString 
	| maskStream nativeStream nextMaskChar |	
	maskStream := mask readStream.
	nativeStream := aString readStream.

	^String new: mask size streamContents: [ :out | 	
		[maskStream atEnd or:[nativeStream atEnd]] whileFalse: [
			nextMaskChar := maskStream next.
			nextMaskChar = asterix 
				ifTrue: [	out nextPut: nativeStream next]
				ifFalse: [ out nextPut: nextMaskChar ]].
		[ maskStream atEnd ] whileFalse: [ out nextPut: maskStream next ]
	].