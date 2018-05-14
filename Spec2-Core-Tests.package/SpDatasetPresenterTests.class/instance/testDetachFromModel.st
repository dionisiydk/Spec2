tests
testDetachFromModel
	
	presenter detachFromModel.
	
	self deny: (model hasSubscriber: presenter)