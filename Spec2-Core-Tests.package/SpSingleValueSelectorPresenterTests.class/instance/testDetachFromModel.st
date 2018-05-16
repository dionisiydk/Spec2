tests
testDetachFromModel

	presenter detachFromModel.
	
	self deny: (model announcer hasSubscriber: presenter)