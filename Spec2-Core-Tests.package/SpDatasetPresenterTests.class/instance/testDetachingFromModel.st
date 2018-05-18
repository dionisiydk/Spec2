tests
testDetachingFromModel
	
	presenter detachFromModel.
	
	self deny: (model hasSubscriber: presenter)