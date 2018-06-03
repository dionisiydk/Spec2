*Spec2-Morphic
executeCommandsOf: aPresenter byDoubleClick: anEvent from: sourceMorph
	
	self 
		executeCommandsOf: aPresenter 
		activatedWith: CmdDoubleClickActivation 
		by: anEvent