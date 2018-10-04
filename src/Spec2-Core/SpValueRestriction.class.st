"
I represent restriction on possible values for given objects.

My subclases must implement validation logic in #matches: method: 

	restriction matches: anObject
"
Class {
	#name : #SpValueRestriction,
	#superclass : #Object,
	#classInstVars : [
		'default'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #accessing }
SpValueRestriction class >> default [
	^default ifNil: [ default := self new ]
]

{ #category : #'instance creation' }
SpValueRestriction class >> not [
	^self new not
		
]

{ #category : #composing }
SpValueRestriction >> & aRestriction [
	^SpAndRestriction option1: self option2: aRestriction
]

{ #category : #comparing }
SpValueRestriction >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	^self class = anObject class
]

{ #category : #comparing }
SpValueRestriction >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self class hash
]

{ #category : #testing }
SpValueRestriction >> matches: anObject [
	self subclassResponsibility 
]

{ #category : #composing }
SpValueRestriction >> not [
	^SpNotRestriction negate: self
]

{ #category : #composing }
SpValueRestriction >> | aRestriction [
	^SpOrRestriction option1: self option2: aRestriction
]
