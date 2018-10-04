"
My subclasses decorate strings with specific way. They can format given string by inserting extra characters. Or they ca affect string modification operations.

They shoud implement mappings between decorated string and native string: 

- convertNativeTextToDecorated: nativeString 
- convertDecoratedTextToNative: decoratedString
- convertNativePosition: indexInNativeString toDecoratedOn: decoratedString
- convertDecoratedPosition: indexInDecoratedString toNativeOn: decoratedString

And they should implement decoration of insertion operation:
- decorateInsertionOf: newString into: decoratedString from: startIndex to: stopIndex


"
Class {
	#name : #SpTextDecoration,
	#superclass : #Object,
	#classInstVars : [
		'default'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #accessing }
SpTextDecoration class >> default [
	^default ifNil: [ default := self new ]
]

{ #category : #operations }
SpTextDecoration >> convertDecoratedPosition: index toNativeOn: decoratedString [

	self subclassResponsibility 
]

{ #category : #operations }
SpTextDecoration >> convertDecoratedTextToNative: decoratedString [

	self subclassResponsibility 
]

{ #category : #operations }
SpTextDecoration >> convertNativePosition: index toDecoratedOn: decoratedString [

	self subclassResponsibility 
]

{ #category : #operations }
SpTextDecoration >> convertNativeTextToDecorated: nativeString [

	self subclassResponsibility 
]

{ #category : #operations }
SpTextDecoration >> decorateInsertionOf: newString into: originalString from: startIndex to: stopIndex [
	self subclassResponsibility 
]
