"
I require value to match all my options
"
Class {
	#name : #SpAndRestriction,
	#superclass : #SpCompositeRestriction,
	#category : 'Spec2-Core-Models'
}

{ #category : #testing }
SpAndRestriction >> matches: anObject [
	^(option1 matches: anObject) and: [ option2 matches: anObject ]
]
