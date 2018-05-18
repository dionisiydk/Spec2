tests
testDetachingFromModel

	presenter detachFromModel.
	
	self deny: (model announcer hasSubscriber: presenter)