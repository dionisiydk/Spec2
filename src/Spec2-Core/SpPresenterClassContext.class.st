Class {
	#name : #SpPresenterClassContext,
	#superclass : #SpUIContext,
	#instVars : [
		'presenterClass'
	],
	#category : 'Spec2-Core-UI'
}

{ #category : #'instance creation' }
SpPresenterClassContext class >> fromClass: aPresenterClass [

	^self new 
		presenterClass: aPresenterClass
]

{ #category : #comparing }
SpPresenterClassContext >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ presenterClass = anObject presenterClass
]

{ #category : #comparing }
SpPresenterClassContext >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ presenterClass hash
]

{ #category : #accessing }
SpPresenterClassContext >> presenterClass [
	^ presenterClass
]

{ #category : #accessing }
SpPresenterClassContext >> presenterClass: anObject [
	presenterClass := anObject
]

{ #category : #printing }
SpPresenterClassContext >> printOn: aStream [
	super printOn: aStream.
	
	aStream nextPut: $(.
	presenterClass printOn: aStream. 
	aStream nextPut: $).
]
