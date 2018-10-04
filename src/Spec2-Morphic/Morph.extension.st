Extension { #name : #Morph }

{ #category : #'*Spec2-Morphic' }
Morph >> enableMouseClickForCommandsOf: aPresenter [
	
	self 
		on: #click 
		send: #executeCommandsOf:byClick:from: to: self withValue: aPresenter.
	
	"Following subscribtion is requried because morphic does not generate mouse click 
	when right mouse (yellow) was clicked. In that case mouse up is triggered"
	self 
		on: #mouseUp
		send: #executeCommandsOf:byYellowClick:from: to: self withValue: aPresenter
]

{ #category : #'*Spec2-Morphic' }
Morph >> enableMouseDoubleClickForCommandsOf: aPresenter [
	
	self 
		on: #doubleClick 
		send: #executeCommandsOf:byDoubleClick:from: to: self withValue: aPresenter
]

{ #category : #'*Spec2-Morphic' }
Morph >> enableShortcutsForCommandsOf: aPresenter [

	CmdKMDispatcher attachedTo: self withCommandsFrom: aPresenter
]

{ #category : #'*Spec2-Morphic' }
Morph >> executeCommandsOf: aPresenter activatedWith: aMouseActivationStrategy by: anEvent [ 
	| targetContext |
	
	targetContext := aPresenter	createCommandContextForCursorAt: anEvent cursorPoint.
	
	aMouseActivationStrategy executeCommandInContext: targetContext.
	
	anEvent wasHandled: false
]

{ #category : #'*Spec2-Morphic' }
Morph >> executeCommandsOf: aPresenter byClick: anEvent from: sourceMorph [
	
	self 
		executeCommandsOf: aPresenter 
		activatedWith: CmdClickActivation 
		by: anEvent
]

{ #category : #'*Spec2-Morphic' }
Morph >> executeCommandsOf: aPresenter byDoubleClick: anEvent from: sourceMorph [
	
	self 
		executeCommandsOf: aPresenter 
		activatedWith: CmdDoubleClickActivation 
		by: anEvent
]

{ #category : #'*Spec2-Morphic' }
Morph >> executeCommandsOf: aPresenter byYellowClick: anEvent from: sourceMorph [
	"This method is used to handle yellow mouse click.
	Morphic does not generate mouse click event in that case.
	So here we handle mouse up event and ensure that it was triggered by yellow button"
	
	anEvent yellowButtonChanged ifFalse: [ ^ self ].
	
	self 
		executeCommandsOf: aPresenter 
		activatedWith: CmdClickActivation 
		by: anEvent
]

{ #category : #'*Spec2-Morphic' }
Morph >> onSpecUIEvent: anUIEvent send: aSymbol to: aSubscriber [

	self on: anUIEvent morphicName send: aSymbol to: aSubscriber
]

{ #category : #'*Spec2-Morphic' }
Morph >> specPresenter [

	^self valueOfProperty: #specPresenter
]

{ #category : #'*Spec2-Morphic' }
Morph >> specPresenter: aPresenter [ 
	self setProperty: #specPresenter toValue: aPresenter.
	self setNamePropertyTo: aPresenter printString.
]
