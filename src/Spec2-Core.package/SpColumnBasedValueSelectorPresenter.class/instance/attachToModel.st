initialization
attachToModel
	super attachToModel.
	
	model whenChangedSend: #modelChanged to: self
	