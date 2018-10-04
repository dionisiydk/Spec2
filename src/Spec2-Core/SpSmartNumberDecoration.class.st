"
I format given strings as numbers by splitting characters by thousand groups.
For splitting I use specified thousandsSeparator string which is space by default.

Try following examples
	
	SpSmartNumberDecoration new convertNativeTextToDecorated: '12000111'. "" => 12 000 111""
	SpSmartNumberDecoration new convertDecoratedTextToNative: '12 000 111'. "" => 12000111""
	
I do not convert numbers or analyze that characters are digits. I just separate them by group with 3 items. So following is also working:

	SpSmartNumberDecoration new convertNativeTextToDecorated: 'abcdf'. '""ab cdf""'

Also I take into account possible decimal separator: 

	SpSmartNumberDecoration new convertNativeTextToDecorated: '12000.12'. "" => 12 000.12""
	SpSmartNumberDecoration new convertDecoratedTextToNative: '12 000.12'.	"" => 12000.12""	 

Instance Variables
	thousandsSeparator:		<String>

"
Class {
	#name : #SpSmartNumberDecoration,
	#superclass : #SpTextDecoration,
	#instVars : [
		'thousandsSeparator'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #operations }
SpSmartNumberDecoration >> convertDecoratedPosition: index toNativeOn: aString [
	
	| stringBeforeIndex nativeString |
	stringBeforeIndex := aString copyFrom: 1 to: (index min: aString size).
	nativeString := self convertDecoratedTextToNative: stringBeforeIndex.
	
	^index - (stringBeforeIndex size - nativeString size)
]

{ #category : #operations }
SpSmartNumberDecoration >> convertDecoratedTextToNative: aString [

	^aString copyReplaceAll: thousandsSeparator with: ''.
]

{ #category : #operations }
SpSmartNumberDecoration >> convertNativePosition: index toDecoratedOn: aString [
	
	| nativeIndex |
	
	index = 0 ifTrue: [ ^index ].
	
	nativeIndex := 0.
	1 to: aString size do: [ :i |
		(thousandsSeparator includes: (aString at: i)) ifFalse: [ 
			nativeIndex := nativeIndex + 1.
		 ].
		nativeIndex >= index ifTrue: [ ^i ]].
	
	^aString size
]

{ #category : #operations }
SpSmartNumberDecoration >> convertNativeTextToDecorated: aString [ 
	
	| decimalSeparator integerPart stream decimalPart integerStream result |
	decimalSeparator := aString detect: [ :each | each = $. or: [each = $,] ] ifNone: [ nil ].
	decimalSeparator 
		ifNil: [ integerPart := aString ]
		ifNotNil: [ stream := aString readStream.
			integerPart := stream upTo: decimalSeparator.
			decimalPart := stream upToEnd].
	
	integerPart := self convertDecoratedTextToNative: integerPart.
	result := String streamContents: [ :s |
		decimalSeparator ifNotNil: [ s nextPutAll: decimalPart reversed; nextPut: decimalSeparator].
		integerStream := integerPart reversed readStream.
		[integerStream atEnd] whileFalse: [
			s nextPutAll: (integerStream next: 3).
			integerStream atEnd ifFalse: [ s nextPutAll: thousandsSeparator].
		 ]		
	 ].

	^result reversed
]

{ #category : #operations }
SpSmartNumberDecoration >> decorateInsertionOf: newString into: originalString from: startIndex to: stopIndex [
	| modifiedString |
	modifiedString := originalString copyReplaceFrom: startIndex to: stopIndex with: newString.
	^self convertNativeTextToDecorated: modifiedString
]

{ #category : #initialization }
SpSmartNumberDecoration >> initialize [ 
	super initialize.
	
	thousandsSeparator := ' '
]

{ #category : #accessing }
SpSmartNumberDecoration >> thousandsSeparator [
	
	^ thousandsSeparator
]

{ #category : #accessing }
SpSmartNumberDecoration >> thousandsSeparator: anObject [
	
	thousandsSeparator := anObject
]
