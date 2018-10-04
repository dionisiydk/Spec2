*Spec2-Morphic
executeCommandsOf: aPresenter byYellowClick: anEvent from: sourceMorph
	"This method is used to handle yellow mouse click.
	Morphic does not generate mouse click event in that case.
	So here we handle mouse up event and ensure that it was triggered by yellow button"
	
	anEvent yellowButtonChanged ifFalse: [ ^ self ].
	
	self 
		executeCommandsOf: aPresenter 
		activatedWith: CmdClickActivation 
		by: anEvent