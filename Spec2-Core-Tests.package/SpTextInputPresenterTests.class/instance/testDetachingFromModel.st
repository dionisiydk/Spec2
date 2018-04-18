tests
testDetachingFromModel
	
	presenter detachFromModel.	
	self deny: (presenter model announcer hasSubscriber: presenter)