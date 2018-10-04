"
I negate given actual restriction. I represent #not operation for restriction. 
 
Internal Representation and Key Implementation Points.

    Instance Variables
	actualRestriction:		<SpValueRestriction>

"
Class {
	#name : #SpNotRestriction,
	#superclass : #SpValueRestriction,
	#instVars : [
		'actualRestriction'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #'instance creation' }
SpNotRestriction class >> negate: aRestriction [
	^self new 
		actualRestriction: aRestriction
]

{ #category : #comparing }
SpNotRestriction >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ actualRestriction = anObject actualRestriction
]

{ #category : #accessing }
SpNotRestriction >> actualRestriction [
	^ actualRestriction
]

{ #category : #accessing }
SpNotRestriction >> actualRestriction: anObject [
	actualRestriction := anObject
]

{ #category : #comparing }
SpNotRestriction >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ actualRestriction hash
]

{ #category : #testing }
SpNotRestriction >> matches: anObject [
	^(actualRestriction matches: anObject) not
]
