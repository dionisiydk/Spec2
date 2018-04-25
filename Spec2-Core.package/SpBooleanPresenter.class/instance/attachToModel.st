initialization
attachToModel
	super attachToModel.
	
	model whenChangedSend: #rebuild to: self