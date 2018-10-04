"
I match strings which represent decimal numbers with:

- decimalSeparators, a collection (string) of possible decimal separators
- decimalDigitsCount, max decimal digits which allowed for given string

By default I describe numbers eigher with dot or comma decimal separator and two decimal digits:

- 123
- 123.12

You can create my instances with desired decimal digits: 

	SpDecimalTextRestriction maxDecimalDigits: 3
	
Instance Variables
	decimalSeparators:		<String>
	decimalDigitsCount:		<Integer>
"
Class {
	#name : #SpDecimalTextRestriction,
	#superclass : #SpTextRestriction,
	#instVars : [
		'decimalSeparators',
		'decimalDigitsCount'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #'instance creation' }
SpDecimalTextRestriction class >> maxDecimalDigits: aNumber [
	^self new 
		decimalDigitsCount: aNumber
]

{ #category : #accessing }
SpDecimalTextRestriction >> decimalDigitsCount [
	^ decimalDigitsCount
]

{ #category : #accessing }
SpDecimalTextRestriction >> decimalDigitsCount: anObject [
	decimalDigitsCount := anObject
]

{ #category : #accessing }
SpDecimalTextRestriction >> decimalSeparators [
	^ decimalSeparators
]

{ #category : #accessing }
SpDecimalTextRestriction >> decimalSeparators: anObject [
	decimalSeparators := anObject
]

{ #category : #initialization }
SpDecimalTextRestriction >> initialize [ 
	super initialize.
	
	decimalSeparators := '.,'.
	decimalDigitsCount := Float infinity
]

{ #category : #testing }
SpDecimalTextRestriction >> matchesString: aString [

	| activeSeparator decimalPart |
	aString ifEmpty: [ ^true ].
	decimalDigitsCount = 0 ifTrue: [ ^aString isAllDigits ].
	
	activeSeparator := aString detect: [ :each | decimalSeparators includes: each ] ifNone: [ 
		^aString isAllDigits ].
	
	(aString occurrencesOf:  activeSeparator) > 1 ifTrue: [ ^false ].
	
	(aString allSatisfy: [ :each | each = activeSeparator or: [each isDigit]  ])
		ifFalse: [ ^false].
		
	decimalPart := aString readStream upTo: activeSeparator; upToEnd.
	^decimalPart size <= decimalDigitsCount 
]
