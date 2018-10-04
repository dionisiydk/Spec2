*Spec2-Morphic
enableMouseDoubleClickForCommandsOf: aPresenter
	
	self 
		on: #doubleClick 
		send: #executeCommandsOf:byDoubleClick:from: to: self withValue: aPresenter