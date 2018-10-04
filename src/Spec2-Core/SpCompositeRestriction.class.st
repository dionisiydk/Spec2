"
My subclasses represent composition of two restrictions: option1 and option2.

Create my instances using following expression: 

	SpCompositeRestriction option1: aRestriction1 option2: aRestriction2.
	
Or use composition messages directly on restrictions:

	aRestriction and: aRestriction2.
	aRestriction or: aRestriction2
 
Internal Representation and Key Implementation Points.

    Instance Variables
	option1:		<SpValueRestriction>
	option2:		<SpValueRestriction>


    Implementation Points
"
Class {
	#name : #SpCompositeRestriction,
	#superclass : #SpValueRestriction,
	#instVars : [
		'option2',
		'option1'
	],
	#category : 'Spec2-Core-Models'
}

{ #category : #'instance creation' }
SpCompositeRestriction class >> option1: aRestriction1 option2: aRestriction2 [
	^self new 
		option1: aRestriction1;
		option2: aRestriction2
]

{ #category : #comparing }
SpCompositeRestriction >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ option1 = anObject option1 and: [ option2 = anObject option2 ]
]

{ #category : #comparing }
SpCompositeRestriction >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ option1 hash bitXor: option2 hash
]

{ #category : #accessing }
SpCompositeRestriction >> option1 [
	^ option1
]

{ #category : #accessing }
SpCompositeRestriction >> option1: anObject [
	option1 := anObject
]

{ #category : #accessing }
SpCompositeRestriction >> option2 [
	^ option2
]

{ #category : #accessing }
SpCompositeRestriction >> option2: anObject [
	option2 := anObject
]

{ #category : #'text validation' }
SpCompositeRestriction >> validateInsertionOf: newString into: originalString from: startIndex to: endIndex [ 
	^self matches: (originalString copyReplaceFrom: startIndex to: endIndex with: newString)
]
