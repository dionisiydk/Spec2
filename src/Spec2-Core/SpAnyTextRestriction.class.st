"
I matches any string
"
Class {
	#name : #SpAnyTextRestriction,
	#superclass : #SpTextRestriction,
	#category : 'Spec2-Core-Models'
}

{ #category : #testing }
SpAnyTextRestriction >> matchesString: aString [
	^true
]

{ #category : #validation }
SpAnyTextRestriction >> validateInsertionOf: aString into: startIndex from: endIndex to: newString [
	^true
]
