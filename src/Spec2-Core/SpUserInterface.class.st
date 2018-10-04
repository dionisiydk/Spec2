Class {
	#name : #SpUserInterface,
	#superclass : #Object,
	#classVars : [
		'Current'
	],
	#category : 'Spec2-Core-UI'
}

{ #category : #accessing }
SpUserInterface class >> current [
	^Current ifNil: [ Current := SpMorphicUI new ]
]

{ #category : #accessing }
SpUserInterface class >> reset [
	<script>
	Current := nil
]

{ #category : #'presenter building' }
SpUserInterface >> annotateView: aView withPresenter: aPresenter [
	"For debugging and inspection it is important to have information about presenter directly in views.
	Subclasses should put such reference and use it for tools"
	
	self subclassResponsibility 
]

{ #category : #'presenter building' }
SpUserInterface >> createDefaulViewContainer [
	self subclassResponsibility 
]

{ #category : #'layout views' }
SpUserInterface >> createLayoutBuilderOn: aPresenter [
	self subclassResponsibility 
]

{ #category : #resources }
SpUserInterface >> iconForLabel: iconName [

	^Smalltalk ui icons iconNamed: iconName
]

{ #category : #'layout views' }
SpUserInterface >> layout: aPresenter with: aBlock [

	(self createLayoutBuilderOn: aPresenter) buildBy: aBlock
]

{ #category : #opening }
SpUserInterface >> openContextMenu: aCmdMenu of: aPresenter [

	self subclassResponsibility 
]

{ #category : #opening }
SpUserInterface >> openInVerticalPopup: aPresenter over: parentMorph with: popupInitBlock [
	
	self subclassResponsibility 
	
]

{ #category : #opening }
SpUserInterface >> openInWindow: aPresenter [

	self subclassResponsibility 
]

{ #category : #opening }
SpUserInterface >> openModal: aPresenter over: aView with: anInitBlock [
	"aView is a parent view which will be blocked during modal dialog.
	anInit block should receive the modal view showing given aPresenter.
	This modal view should know how to #close dialog"
	self subclassResponsibility 
]

{ #category : #'presenter building' }
SpUserInterface >> replaceView: existingView by: newView [
	self subclassResponsibility 
]

{ #category : #'presenter building' }
SpUserInterface >> setUpViewFor: aPresenter [
	self subclassResponsibility 
]

{ #category : #events }
SpUserInterface >> simulate: anUIEventClass on: aView [
	"For testing purpose subclasses should implement event simulation logic 
	which should correspond to event subscription #when:on:do:"
	
	self subclassResponsibility 
]

{ #category : #resources }
SpUserInterface >> textForLabel: labelString [

	^labelString translated
]

{ #category : #resources }
SpUserInterface >> theme [
	^Smalltalk ui theme
]

{ #category : #events }
SpUserInterface >> when: anUIEvent on: aView do: handlerBlock [
	"Subclasses should delegate subscription to given event object with concrete backend message"
	self subclassResponsibility 
]
