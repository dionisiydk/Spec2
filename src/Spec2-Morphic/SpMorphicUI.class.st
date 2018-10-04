Class {
	#name : #SpMorphicUI,
	#superclass : #SpPragmaBasedUI,
	#category : 'Spec2-Morphic-UI'
}

{ #category : #'presenter building' }
SpMorphicUI >> annotateView: aMorph withPresenter: aPresenter [
	"For debugging and inspection it is important to have information about presenter directly in views.
	Subclasses should put such reference and use it for tools"
	
	aMorph specPresenter: aPresenter
]

{ #category : #'presenter building' }
SpMorphicUI >> createDefaulViewContainer [
	^SpContainerMorph new
]

{ #category : #'layout views' }
SpMorphicUI >> createLayoutBuilderOn: aPresenter [
	^SpMorphicUILayoutBuilder on: aPresenter
]

{ #category : #opening }
SpMorphicUI >> openContextMenu: aCmdMenu of: aPresenter [

	| morphicMenu |
	morphicMenu := aCmdMenu buildContextMenuFor: aPresenter view.
	morphicMenu hasItems ifFalse: [ ^self ].
	
	morphicMenu setInvokingView: aPresenter view.
	morphicMenu invokeModal
]

{ #category : #opening }
SpMorphicUI >> openInVerticalPopup: aPresenter over: parentMorph with: popupInitBlock [
	
	| popup |
	popup := SpPopupMorph with: aPresenter.	
	popupInitBlock value: popup.
	
	popup openVerticalOver: parentMorph
]

{ #category : #opening }
SpMorphicUI >> openInWindow: aPresenter [

	aPresenter view openInWindow
]

{ #category : #opening }
SpMorphicUI >> openModal: aPresenter over: parentMorph with: anInitBlock [

	| modalContainer |
	modalContainer := SpModalMorph new.	
	aPresenter view 
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	modalContainer addMorphBack: aPresenter view.
	anInitBlock value: modalContainer.
	
	parentMorph openModal: modalContainer
]

{ #category : #'presenter building' }
SpMorphicUI >> replaceView: existingMorph by: newMorph [
	
	newMorph 
		extent: existingMorph extent;
		position: existingMorph position;
		layoutPolicy: existingMorph layoutPolicy.
	existingMorph layoutFrame ifNotNil: [ 
		newMorph layoutFrame: existingMorph layoutFrame ].
	
	existingMorph owner replaceSubmorph: existingMorph by: newMorph.
	existingMorph becomeForward: newMorph 
	"Become is required to ensure that new morph will process upcoming UI events which correspond to old morph. For example mouseUp can be evaluated just after click. 
	It happens when presenter replaces view for new style just inside event procesing logic"
]

{ #category : #events }
SpMorphicUI >> safeUIEventHandlerFrom: handlerBlock [

	^[
		handlerBlock on: Error fork: [ :err | err pass ]
	]
]

{ #category : #'presenter building' }
SpMorphicUI >> setUpUndefinedViewFor: aPresenter [
	aPresenter view: 'undefined view' asMorph
]

{ #category : #events }
SpMorphicUI >> when: anUIEvent on: aMorph do: handlerBlock [
	
	aMorph onSpecUIEvent: anUIEvent send: #value to: (self safeUIEventHandlerFrom: handlerBlock)
]
