*Spec2-Morphic
executeCommandsOf: aPresenter byClick: anEvent from: sourceMorph
	
	self 
		executeCommandsOf: aPresenter 
		activatedWith: CmdClickActivation 
		by: anEvent