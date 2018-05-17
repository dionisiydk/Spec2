initialization
attachToModel
	super attachToModel.
	
	optionSelection attachToActualModel: model.
	model whenChangedSend: #propogateChanges to: self