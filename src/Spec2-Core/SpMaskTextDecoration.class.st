"
I mask given strings.

To create my instances use following expression: 

	SpMaskTextDecoration mask: '8(***)***-**-**'

Try following examples: 

	(SpMaskTextDecoration mask: '8(***)*-**-**') 
		convertNativeTextToDecorated: '12345'. "" => 8(123)4-5*-**""
		
	(SpMaskTextDecoration mask: '8(***)*-**-**') 
		convertDecoratedTextToNative: '8(123)4-*6-**'. "" => 1234*6**""

By default I use * character as asterix. But it can be redefined in my variable #asterix
	
	Instance Variables
		mask:		<String>
		asterix:		<Character>
"
Class {
	#name : #SpMaskTextDecoration,
	#superclass : #SpTextDecoration,
	#instVars : [
		'mask',
		'asterix'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #'instance creation' }
SpMaskTextDecoration class >> mask: maskString [
	^self new 
		mask: maskString 
]

{ #category : #'instance creation' }
SpMaskTextDecoration class >> mask: maskString asterix: aCharacter [
	^(self mask: maskString) 
		asterix: aCharacter
		
]

{ #category : #accessing }
SpMaskTextDecoration >> asterix [
	^ asterix
]

{ #category : #accessing }
SpMaskTextDecoration >> asterix: anObject [
	asterix := anObject
]

{ #category : #operations }
SpMaskTextDecoration >> convertDecoratedPosition: index toNativeOn: decoratedString [ 
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

]

{ #category : #operations }
SpMaskTextDecoration >> convertDecoratedTextToNative: aString [ 
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
]

{ #category : #operations }
SpMaskTextDecoration >> convertNativePosition: index toDecoratedOn: decoratedString [ 
	| nativeCounter |
	nativeCounter := 0.
	mask withIndexDo: [:each :i |  
		(each = asterix) ifTrue: [ nativeCounter := nativeCounter + 1 ].
		nativeCounter = index ifTrue: [ ^i ]
	].
	^mask size
]

{ #category : #operations }
SpMaskTextDecoration >> convertNativeTextToDecorated: aString [ 
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
]

{ #category : #operations }
SpMaskTextDecoration >> decorateInsertionOf: newString into: decoratedString from: startIndex to: stopIndex [
	
	| cleanedString |
	cleanedString := self deleteCharactersFrom: decoratedString startingAt: startIndex to: stopIndex.
	^self overrideCharactersFrom: cleanedString by: newString startingAt: startIndex
]

{ #category : #operations }
SpMaskTextDecoration >> deleteCharactersFrom: decoratedString startingAt: startIndex to: stopIndex [
	
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
]

{ #category : #initialization }
SpMaskTextDecoration >> initialize [ 
	super initialize.
	
	asterix := $*.
	mask := 'undefined mask'
]

{ #category : #accessing }
SpMaskTextDecoration >> mask [
	^ mask
]

{ #category : #accessing }
SpMaskTextDecoration >> mask: anObject [
	mask := anObject
]

{ #category : #operations }
SpMaskTextDecoration >> overrideCharactersFrom: decoratedString by: newString startingAt: startIndex [
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
]
