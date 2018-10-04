Class {
	#name : #SpThemeContext,
	#superclass : #SpUIContext,
	#instVars : [
		'themeClass'
	],
	#category : 'Spec2-Core-UI'
}

{ #category : #'instance creation' }
SpThemeContext class >> fromClass: aThemeClass [

	^self new 
		themeClass: aThemeClass
]

{ #category : #comparing }
SpThemeContext >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ themeClass = anObject themeClass
]

{ #category : #comparing }
SpThemeContext >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ themeClass hash
]

{ #category : #testing }
SpThemeContext >> isSuitableFor: aPresenter [
	^aPresenter ui theme isKindOf: themeClass
]

{ #category : #printing }
SpThemeContext >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	themeClass printOn: aStream. 
	aStream nextPut: $)
]

{ #category : #accessing }
SpThemeContext >> themeClass [
	^ themeClass
]

{ #category : #accessing }
SpThemeContext >> themeClass: anObject [
	themeClass := anObject
]
