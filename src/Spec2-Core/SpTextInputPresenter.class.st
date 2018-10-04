Class {
	#name : #SpTextInputPresenter,
	#superclass : #SpSimplePresenter,
	#instVars : [
		'textDecoration',
		'inputRestriction'
	],
	#category : 'Spec2-Core-Presenters'
}

{ #category : #'instance creation' }
SpTextInputPresenter class >> restriction: aTextRestriction decoration: aTextDecoration [
	^self new 
		inputRestriction: aTextRestriction;
		textDecoration: aTextDecoration
]

{ #category : #initialization }
SpTextInputPresenter >> attachToModel [
	
	model whenChangedSend: #updateView to: self
]

{ #category : #initialization }
SpTextInputPresenter >> attachToView [
	
	view inputRestriction: inputRestriction.
	view textDecoration: textDecoration.
	model isReadOnly ifTrue: [view beReadOnly].
	self updateView.
	
	view whenTextChangedSend: #updateModel to: self
]

{ #category : #initialization }
SpTextInputPresenter >> detachFromModel [
	
	model unsubscribe: self

]

{ #category : #initialization }
SpTextInputPresenter >> initialize [
	super initialize.
	
	inputRestriction := SpAnyTextRestriction default.
	textDecoration := SpNoTextDecoration default
]

{ #category : #accessing }
SpTextInputPresenter >> inputRestriction [
	^ inputRestriction
]

{ #category : #accessing }
SpTextInputPresenter >> inputRestriction: anObject [
	inputRestriction := anObject
]

{ #category : #accessing }
SpTextInputPresenter >> model: anObject [
	super model: anObject asTextValueHolder
]

{ #category : #testing }
SpTextInputPresenter >> showsValidData [
	
	^model isValid
]

{ #category : #accessing }
SpTextInputPresenter >> textDecoration [
	^ textDecoration
]

{ #category : #accessing }
SpTextInputPresenter >> textDecoration: anObject [
	textDecoration := anObject
]

{ #category : #updating }
SpTextInputPresenter >> updateModel [

	| nativeString |
	nativeString := textDecoration convertDecoratedTextToNative: view contents asString.
	
	self detachFromModel.
	[model value: nativeString] ensure: [ self attachToModel ]
]

{ #category : #updating }
SpTextInputPresenter >> updateView [
	model synchronize.
	view showNewText: model value
]
