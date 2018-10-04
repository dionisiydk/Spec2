Class {
	#name : #SpContainerMorph,
	#superclass : #BorderedMorph,
	#category : 'Spec2-Morphic-Views'
}

{ #category : #initialization }
SpContainerMorph >> defaultBorderColor [
	^Color transparent
]

{ #category : #initialization }
SpContainerMorph >> defaultBorderWidth [
	^0
]

{ #category : #initialization }
SpContainerMorph >> defaultColor [
	^Color transparent
]

{ #category : #initialization }
SpContainerMorph >> initialize [
	super initialize.
	
	self clipSubmorphs: true
]
