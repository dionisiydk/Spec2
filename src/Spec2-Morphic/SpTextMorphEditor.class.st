Class {
	#name : #SpTextMorphEditor,
	#superclass : #RubTextEditor,
	#category : 'Spec2-Morphic-Views'
}

{ #category : #accessing }
SpTextMorphEditor >> inputRestriction [
	^self textMorph inputRestriction
]

{ #category : #'accessing-selection' }
SpTextMorphEditor >> nativeText [

	^self textDecoration convertDecoratedTextToNative: self text
]

{ #category : #'accessing-selection' }
SpTextMorphEditor >> prepareEmphasisForTextDeletionFrom: start to: stop [
	stop > start ifFalse: [ ^self ].
	
	"If deleting, then set emphasisHere from 1st character of the deletion"
	self editingState emphasisHere: ((self text attributesAt: start) select: [ :att | att mayBeExtended ])
]

{ #category : #'accessing-selection' }
SpTextMorphEditor >> publishTextChanges [
	self textMorph hasUnacceptedEdits ifTrue: [^self].
	
	self textMorph publishTextChanges
]

{ #category : #accessing }
SpTextMorphEditor >> textDecoration [
	^self textMorph textDecoration
]

{ #category : #accessing }
SpTextMorphEditor >> textMorph [
	^textArea editingMode textMorph
]

{ #category : #'accessing-selection' }
SpTextMorphEditor >> validateModificationBy: aText [
	"The main logic is copied from superclass and adopted for decoration and validation"
	| start stop |
	start := self startIndex.
	stop := self stopIndex.
	(start = stop and: [ aText size = 0 ]) ifTrue: [ ^false].

	^self inputRestriction 
		validateInsertionOf: aText asString into: self nativeText asString
		from: (self textDecoration convertDecoratedPosition: start toNativeOn: self text) 
		to: (self textDecoration convertDecoratedPosition: stop - 1 toNativeOn: self text)
]

{ #category : #'accessing-selection' }
SpTextMorphEditor >> zapSelectionWith: newText [
	"The main logic is copied from superclass and adopted for decoration and validation"
	| start stop decoratedText nativeStart decoratedEnd |
	self canChangeText ifFalse: [ ^ self ].
	start := self startIndex.
	stop := self stopIndex.
	(self validateModificationBy: newText) ifFalse: [ ^self ].	
	newText isEmpty ifTrue: [ self prepareEmphasisForTextDeletionFrom: start to: stop].

	decoratedText := self textDecoration 
		decorateInsertionOf: newText into: self text from: start to: stop - 1.
	
	textArea privateReplaceFrom: 1 to: self text size with: decoratedText asText.

	nativeStart := self textDecoration 
		convertDecoratedPosition: start toNativeOn: self text.
	decoratedEnd := self textDecoration 
		convertNativePosition: nativeStart + newText size - 1 toDecoratedOn: self text.
	self markIndex: start pointIndex: decoratedEnd + 1.
	self editingState previousInterval: self selectionInterval.
	self publishTextChanges
]
