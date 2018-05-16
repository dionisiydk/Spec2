initialization
detachFromModel
	super detachFromModel.
	
	model unsubscribe: self.
	optionSelection detachFromActualModel: model