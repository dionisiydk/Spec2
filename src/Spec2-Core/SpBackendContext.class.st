Class {
	#name : #SpBackendContext,
	#superclass : #SpUIContext,
	#instVars : [
		'uiClass'
	],
	#category : 'Spec2-Core-UI'
}

{ #category : #'instance creation' }
SpBackendContext class >> fromClass: anUserInterfaceClass [

	^self new 
		uiClass: anUserInterfaceClass
]

{ #category : #comparing }
SpBackendContext >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ uiClass = anObject uiClass
]

{ #category : #comparing }
SpBackendContext >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ uiClass hash
]

{ #category : #testing }
SpBackendContext >> isSuitableFor: aPresenter [
	^aPresenter ui class = uiClass
]

{ #category : #printing }
SpBackendContext >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	uiClass printOn: aStream. 
	aStream nextPut: $)
]

{ #category : #accessing }
SpBackendContext >> uiClass [
	^ uiClass
]

{ #category : #accessing }
SpBackendContext >> uiClass: anObject [
	uiClass := anObject
]
