*Spec2-Morphic
enableMouseClickForCommandsOf: aPresenter
	
	self 
		on: #click 
		send: #executeCommandsOf:byClick:from: to: self withValue: aPresenter.
	
	"Following subscribtion is requried because morphic does not generate mouse click 
	when right mouse (yellow) was clicked. In that case mouse up is triggered"
	self 
		on: #mouseUp
		send: #executeCommandsOf:byYellowClick:from: to: self withValue: aPresenter