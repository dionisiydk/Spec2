"
I do not apply any decoration to given strings.
"
Class {
	#name : #SpNoTextDecoration,
	#superclass : #SpTextDecoration,
	#category : 'Spec2-Core-Models'
}

{ #category : #operations }
SpNoTextDecoration >> convertDecoratedPosition: index toNativeOn: decoratedString [

	^index
]

{ #category : #operations }
SpNoTextDecoration >> convertDecoratedTextToNative: decoratedString [

	^decoratedString
]

{ #category : #operations }
SpNoTextDecoration >> convertNativePosition: index toDecoratedOn: decoratedString [

	^index
]

{ #category : #operations }
SpNoTextDecoration >> convertNativeTextToDecorated: nativeString [

	^nativeString
]

{ #category : #operations }
SpNoTextDecoration >> decorateInsertionOf: newString into: originalString from: startIndex to: stopIndex [
	
	^originalString copyReplaceFrom: startIndex to: stopIndex with: newString
]
