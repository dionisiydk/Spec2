Class {
	#name : #SpTextMorph,
	#superclass : #SpContainerMorph,
	#instVars : [
		'textModel',
		'textMorph',
		'textDecoration',
		'inputRestriction'
	],
	#category : 'Spec2-Morphic-Views'
}

{ #category : #accessing }
SpTextMorph >> beReadOnly [

	textMorph enabled: false
]

{ #category : #subscription }
SpTextMorph >> changesAcceptedByRubric [

	textMorph autoAccept ifTrue: [ ^self ].
	
	self publishTextChanges
]

{ #category : #accessing }
SpTextMorph >> contents [
	^textMorph text
]

{ #category : #initialization }
SpTextMorph >> createRubTextMorph [
	^(SpAdoptedRubTextMorph on: textModel) 
		getSelectionSelector: #primarySelectionInterval; 
		yourself
]

{ #category : #shortcuts }
SpTextMorph >> enableShortcutsForCommandsOf: aPresenter [

	textMorph textArea enableShortcutsForCommandsOf: aPresenter
]

{ #category : #testing }
SpTextMorph >> hasUnacceptedEdits [
	^textMorph hasUnacceptedEdits
]

{ #category : #initialization }
SpTextMorph >> initialize [
	super initialize.
	self changeTableLayout.
	self initializeTextMorph.
	self minHeight: self minTextHeight.
	self addMorphBack: textMorph.
	inputRestriction := SpAnyTextRestriction default.
	textDecoration := SpNoTextDecoration default
]

{ #category : #initialization }
SpTextMorph >> initializeTextMorph [
	textModel := RubScrolledTextModel new.
	textModel interactionModel: self.
	textMorph := self createRubTextMorph.
	textMorph vResizing: #spaceFill.
	textMorph hResizing: #spaceFill.
	textMorph editingMode: (SpTextMorphEditingMode for: self).
	textMorph announcer when: RubTextAccepted send: #changesAcceptedByRubric to: self.
	textMorph autoAccept: true
]

{ #category : #accessing }
SpTextMorph >> inputRestriction [
	^ inputRestriction
]

{ #category : #accessing }
SpTextMorph >> inputRestriction: anObject [
	inputRestriction := anObject
]

{ #category : #initialization }
SpTextMorph >> minTextHeight [
	| vgap |
	vgap := textMorph currentHScrollBarThickness isZero
		ifTrue: [  0 ]
		ifFalse: [ self currentHScrollBarThickness - 1 ].
	^ textMorph textArea height + 1 + (textMorph borderWidth * 2) + vgap
]

{ #category : #subscription }
SpTextMorph >> onSpecUIEvent: anUIEvent send: aSymbol to: aSubscriber [

	textMorph textArea onSpecUIEvent: anUIEvent send: aSymbol to: aSubscriber
]

{ #category : #subscription }
SpTextMorph >> publishTextChanges [
	
	self announcer announce: SpTextMorphContentsAccepted
]

{ #category : #operations }
SpTextMorph >> showNewText: aString [

	textModel setInitialText: aString
]

{ #category : #accessing }
SpTextMorph >> textDecoration [
	^ textDecoration
]

{ #category : #accessing }
SpTextMorph >> textDecoration: anObject [
	textDecoration := anObject
]

{ #category : #subscription }
SpTextMorph >> whenTextChangedSend: aSelector to: aSubscriber [

	self announcer when: SpTextMorphContentsAccepted send: aSelector to: aSubscriber
]
