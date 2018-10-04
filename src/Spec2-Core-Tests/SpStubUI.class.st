Class {
	#name : #SpStubUI,
	#superclass : #SpPragmaBasedUI,
	#instVars : [
		'simulationAnnouncer',
		'modalRequestSemaphore'
	],
	#category : 'Spec2-Core-Tests-StubUI'
}

{ #category : #'presenter building' }
SpStubUI >> createDefaulViewContainer [
	^SpCompositeViewStub new
]

{ #category : #'layout views' }
SpStubUI >> createLayoutBuilderOn: aPresenter [
	^SpStubUILayoutBuilder on: aPresenter
]

{ #category : #initialization }
SpStubUI >> initialize [
	super initialize.
	
	simulationAnnouncer := Announcer new
]

{ #category : #opening }
SpStubUI >> openInWindow: aPresenter [
	"Windows are not supported by stub IU"
]

{ #category : #opening }
SpStubUI >> openModal: aPresenter over: aView with: anInitBlock [

	| modalContainer |
	modalContainer := SpModalViewStub of: self.	
	modalContainer contents add: aPresenter view.
		
	anInitBlock value: modalContainer.
	
	modalRequestSemaphore := Semaphore new.
	modalRequestSemaphore wait.
]

{ #category : #'presenter building' }
SpStubUI >> replaceView: existingViewStub by: newViewStub [
	
	"Stub has no parent reference. So for now it is unsupported"
]

{ #category : #'presenter building' }
SpStubUI >> setUpUndefinedViewFor: aPresenter [
	aPresenter view: (SpViewStub named: #undefinedView)
]

{ #category : #events }
SpStubUI >> simulate: anUIEventClass on: aView [
	
	aView simulationAnnouncer announce: anUIEventClass
]

{ #category : #events }
SpStubUI >> simulateModalClose [
	
	modalRequestSemaphore signal
]

{ #category : #events }
SpStubUI >> when: anUIEvent on: aView do: handlerBlock [
	"No events are supported by stub UI"
	
	aView simulationAnnouncer when: anUIEvent do: handlerBlock 
]
