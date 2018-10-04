"
I require value to be always nil. 
I am used in composition with other restrictions to represent optional values
"
Class {
	#name : #SpNilValueRestriction,
	#superclass : #SpValueRestriction,
	#category : 'Spec2-Core-Models'
}

{ #category : #testing }
SpNilValueRestriction >> matches: anObject [
	^anObject isNil
]
