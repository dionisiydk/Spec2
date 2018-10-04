"
I require value to match at least one of my options
"
Class {
	#name : #SpOrRestriction,
	#superclass : #SpCompositeRestriction,
	#category : 'Spec2-Core-Models'
}

{ #category : #testing }
SpOrRestriction >> matches: anObject [
	^(option1 matches: anObject) or: [ option2 matches: anObject ]
]
