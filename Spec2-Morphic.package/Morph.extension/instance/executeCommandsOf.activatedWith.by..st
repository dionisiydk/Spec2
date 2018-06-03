*Spec2-Morphic
executeCommandsOf: aPresenter activatedWith: aMouseActivationStrategy by: anEvent 
	| targetContext |
	
	targetContext := aPresenter	createCommandContextForCursorAt: anEvent cursorPoint.
	
	aMouseActivationStrategy executeCommandInContext: targetContext.
	
	anEvent wasHandled: false