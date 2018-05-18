initialization
attachToModel
	super attachToModel.
	
	model whenChangedSend: #propogateChanges to: self