Class {
	#name : #SpTextInputViewStub,
	#superclass : #SpViewStub,
	#instVars : [
		'textDecoration',
		'inputRestriction',
		'changesSubscriber',
		'handlerSelector',
		'updateCount',
		'isReadOnly'
	],
	#category : 'Spec2-Core-Tests-StubUI'
}

{ #category : #accessing }
SpTextInputViewStub >> beReadOnly [
	isReadOnly := true
]

{ #category : #initialization }
SpTextInputViewStub >> initialize [
	super initialize.
	
	isReadOnly := false.
	updateCount := 0
]

{ #category : #accessing }
SpTextInputViewStub >> inputRestriction [
	^ inputRestriction
]

{ #category : #accessing }
SpTextInputViewStub >> inputRestriction: anObject [
	inputRestriction := anObject
]

{ #category : #accessing }
SpTextInputViewStub >> isReadOnly [
	^ isReadOnly
]

{ #category : #operations }
SpTextInputViewStub >> showNewText: aString [
	
	contents := aString.
	updateCount := updateCount + 1
]

{ #category : #'event simulation' }
SpTextInputViewStub >> simulateTextChange: newValue [

	contents := newValue.
	
	changesSubscriber perform: handlerSelector
]

{ #category : #accessing }
SpTextInputViewStub >> textDecoration [
	^ textDecoration
]

{ #category : #accessing }
SpTextInputViewStub >> textDecoration: anObject [
	textDecoration := anObject
]

{ #category : #accessing }
SpTextInputViewStub >> updateCount [
	^ updateCount
]

{ #category : #accessing }
SpTextInputViewStub >> updateCount: anObject [
	^ updateCount := anObject
]

{ #category : #subscription }
SpTextInputViewStub >> whenTextChangedSend: aSymbol to: aSubscriber [ 
	handlerSelector := aSymbol.
	changesSubscriber := aSubscriber
]
