Class {
	#name : #SpPresenterStyleContext,
	#superclass : #SpUIContext,
	#instVars : [
		'presenterStyle'
	],
	#category : 'Spec2-Core-UI'
}

{ #category : #'instance creation' }
SpPresenterStyleContext class >> fromClass: aClass [
	self shouldNotImplement 
]

{ #category : #'instance creation' }
SpPresenterStyleContext class >> style: aSymbol [
	^self new 
		presenterStyle: aSymbol
]

{ #category : #comparing }
SpPresenterStyleContext >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ presenterStyle = anObject presenterStyle
]

{ #category : #comparing }
SpPresenterStyleContext >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ presenterStyle hash
]

{ #category : #testing }
SpPresenterStyleContext >> isSuitableFor: aPresenter [
	^aPresenter currentStyle = presenterStyle
]

{ #category : #accessing }
SpPresenterStyleContext >> presenterStyle [
	^ presenterStyle
]

{ #category : #accessing }
SpPresenterStyleContext >> presenterStyle: anObject [
	presenterStyle := anObject
]

{ #category : #printing }
SpPresenterStyleContext >> printOn: aStream [
	super printOn: aStream.
	
	aStream 
		nextPut: $(;
		nextPutAll: presenterStyle;
		nextPut: $)
]
