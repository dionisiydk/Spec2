"
I require given numbers to be in particular range between minValue and maxValue.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	maxValue:		<Number>
	minValue:		<Number>

"
Class {
	#name : #SpNumberRestriction,
	#superclass : #SpValueRestriction,
	#instVars : [
		'minValue',
		'maxValue'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #accessing }
SpNumberRestriction class >> maxValue: maxNumber [

	^self new 
		maxValue: maxNumber
]

{ #category : #accessing }
SpNumberRestriction class >> minValue: minNumber [

	^self new 
		minValue: minNumber
]

{ #category : #accessing }
SpNumberRestriction class >> minValue: minNumber maxValue: maxNumber [

	^self new 
		minValue: minNumber;
		maxValue: maxNumber
]

{ #category : #comparing }
SpNumberRestriction >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ maxValue = anObject maxValue and: [ minValue = anObject minValue ]
]

{ #category : #comparing }
SpNumberRestriction >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ maxValue hash bitXor: minValue hash
]

{ #category : #initialization }
SpNumberRestriction >> initialize [
	super initialize.
	
	minValue := Float negativeInfinity.
	maxValue := Float infinity
]

{ #category : #testing }
SpNumberRestriction >> matches: aNumber [
	^aNumber isNumber and: [aNumber between: minValue and: maxValue]
]

{ #category : #accessing }
SpNumberRestriction >> maxValue [
	^ maxValue
]

{ #category : #accessing }
SpNumberRestriction >> maxValue: anObject [
	maxValue := anObject
]

{ #category : #accessing }
SpNumberRestriction >> minValue [
	^ minValue
]

{ #category : #accessing }
SpNumberRestriction >> minValue: anObject [
	minValue := anObject
]
