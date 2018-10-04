Class {
	#name : #SpUILayoutBuilder,
	#superclass : #Object,
	#instVars : [
		'presenter',
		'ui',
		'viewContainer'
	],
	#category : 'Spec2-Core-UI'
}

{ #category : #'instance creation' }
SpUILayoutBuilder class >> on: aPresenter [
	^self new 
		presenter: aPresenter
]

{ #category : #'composing presenters' }
SpUILayoutBuilder >> add: childPresenter with: layoutBlock [
 		
	presenter buildChild: childPresenter.
	
	self layoutChildView: childPresenter view with: layoutBlock.
	
	self addChildView: childPresenter view
]

{ #category : #private }
SpUILayoutBuilder >> addChildView: aView [
	self subclassResponsibility
]

{ #category : #'composing presenters' }
SpUILayoutBuilder >> addPanelWith: layoutBlock [

	| currentContainer newContainer |
	currentContainer := viewContainer.
	newContainer := ui createDefaulViewContainer.
	newContainer isMorph ifTrue: [ newContainer setNameTo: 'Panel' ].
	self buildBy: [
		self layoutChildView: newContainer with: [:panelConstraints |	
			viewContainer := newContainer.		 
			layoutBlock value: panelConstraints ]].
	
	viewContainer := currentContainer.
	self addChildView: newContainer
]

{ #category : #'layout-strategies' }
SpUILayoutBuilder >> beFlow [
	self subclassResponsibility 
]

{ #category : #'layout-strategies' }
SpUILayoutBuilder >> beProportional [
	self subclassResponsibility 
]

{ #category : #building }
SpUILayoutBuilder >> buildBy: aBlock [
	aBlock cull: self.
	"Here subclasses can perform extra logic to complete layout changes"
]

{ #category : #private }
SpUILayoutBuilder >> layoutChildView: childView with: layoutBlock [
	self subclassResponsibility
]

{ #category : #'layout-insets' }
SpUILayoutBuilder >> padding: aPoint [ 
	"Setup inside insets for viewContainer"
	self subclassResponsibility 
]

{ #category : #accessing }
SpUILayoutBuilder >> presenter [
	^ presenter
]

{ #category : #accessing }
SpUILayoutBuilder >> presenter: aPresenter [
	presenter := aPresenter.
	ui := presenter ui.
	viewContainer := presenter view
]

{ #category : #accessing }
SpUILayoutBuilder >> ui [
	^ ui
]

{ #category : #accessing }
SpUILayoutBuilder >> ui: anObject [
	ui := anObject
]

{ #category : #accessing }
SpUILayoutBuilder >> viewContainer [
	^ viewContainer
]

{ #category : #accessing }
SpUILayoutBuilder >> viewContainer: anObject [
	viewContainer := anObject
]
