initialization
detachFromModel
	super detachFromModel.
	
	model unsubscribe: self.
	model close.
	