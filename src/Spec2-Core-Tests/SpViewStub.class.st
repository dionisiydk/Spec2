Class {
	#name : #SpViewStub,
	#superclass : #Object,
	#instVars : [
		'ui',
		'presenter',
		'name',
		'contents',
		'color',
		'backgroundColor',
		'simulationAnnouncer'
	],
	#category : 'Spec2-Core-Tests-StubUI'
}

{ #category : #'instance creation' }
SpViewStub class >> named: aString [
	^self new
		name: aString
]

{ #category : #'instance creation' }
SpViewStub class >> of: aStubUI [
	^self new 
		ui: aStubUI
]

{ #category : #accessing }
SpViewStub >> backgroundColor [
	^ backgroundColor
]

{ #category : #'style API' }
SpViewStub >> backgroundColor: anObject [
	backgroundColor := anObject
]

{ #category : #'style API' }
SpViewStub >> borderColor: aColor [ 

]

{ #category : #'style API' }
SpViewStub >> borderWidth: anInteger [ 
]

{ #category : #accessing }
SpViewStub >> color [
	^ color
]

{ #category : #'style API' }
SpViewStub >> color: anObject [
	color := anObject
]

{ #category : #accessing }
SpViewStub >> contents [
	^ contents
]

{ #category : #accessing }
SpViewStub >> contents: anObject [
	contents := anObject
]

{ #category : #'commander support' }
SpViewStub >> enableMouseClickForCommandsOf: aPresenter [ 

]

{ #category : #'commander support' }
SpViewStub >> enableMouseDoubleClickForCommandsOf: aPresenter [ 

]

{ #category : #'commander support' }
SpViewStub >> enableShortcutsForCommandsOf: aPresenter [ 

]

{ #category : #initialization }
SpViewStub >> initialize [
	super initialize.
	
	simulationAnnouncer := Announcer new
]

{ #category : #accessing }
SpViewStub >> name [
	^ name
]

{ #category : #accessing }
SpViewStub >> name: anObject [
	name := anObject
]

{ #category : #accessing }
SpViewStub >> presenter [
	^ presenter
]

{ #category : #accessing }
SpViewStub >> presenter: anObject [
	presenter := anObject
]

{ #category : #accessing }
SpViewStub >> simulationAnnouncer [
	^ simulationAnnouncer
]

{ #category : #accessing }
SpViewStub >> specPresenter [
	^ presenter
]

{ #category : #accessing }
SpViewStub >> ui [
	^ ui
]

{ #category : #accessing }
SpViewStub >> ui: anObject [
	ui := anObject
]
