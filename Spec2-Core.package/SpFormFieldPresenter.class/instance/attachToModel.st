initialization
attachToModel
	super attachToModel.
	
	model whenChangedSend: #valueChanged: to: self