"
My subclasses describes expected text restriction.
They should implement #matches: method to validate given strings: 

	- matches: aString

In addition they can validate insertion operation into strings. I provide default implementation:

	- validateInsertionOf: newString into: originalString from: startIndex to: stopIndex
"
Class {
	#name : #SpTextRestriction,
	#superclass : #SpValueRestriction,
	#category : 'Spec2-Core-Models'
}

{ #category : #testing }
SpTextRestriction >> matches: anObject [
	^(anObject isKindOf: String) and: [ self matchesString: anObject ]
]

{ #category : #testing }
SpTextRestriction >> matchesString: aString [
	self subclassResponsibility 
]

{ #category : #validation }
SpTextRestriction >> validateInsertionOf: newString into: originalString from: startIndex to: endIndex [ 
	^self matchesString: (originalString copyReplaceFrom: startIndex to: endIndex with: newString)
]
