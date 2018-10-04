"
I require that given objects will be the kind of concrete base class.

To create my instances use following instance: 

	SpObjectRestriction baseClass: Boolean
  
Internal Representation and Key Implementation Points.

    Instance Variables
	baseClass:		<Class>
"
Class {
	#name : #SpObjectRestriction,
	#superclass : #SpValueRestriction,
	#instVars : [
		'baseClass'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #'instance creation' }
SpObjectRestriction class >> baseClass: aClass [
	^self new 
		baseClass: aClass
]

{ #category : #comparing }
SpObjectRestriction >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ baseClass = anObject baseClass
]

{ #category : #accessing }
SpObjectRestriction >> baseClass [
	^ baseClass
]

{ #category : #accessing }
SpObjectRestriction >> baseClass: anObject [
	baseClass := anObject
]

{ #category : #comparing }
SpObjectRestriction >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^super hash bitXor: baseClass hash
]

{ #category : #testing }
SpObjectRestriction >> matches: anObject [
	^anObject isKindOf: baseClass
]

{ #category : #printing }
SpObjectRestriction >> printOn: aStream [
	super printOn: aStream.
	
	aStream 
		nextPut: $(;
		print: baseClass;
		nextPut: $)
]
