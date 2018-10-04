tests
testDetachingFromModel
	
	presenter detachFromModel.	
	self deny: (presenter model announcer hasSubscriber: presenter).

	self deny: (presenter valuePresenter model announcer hasSubscriber: presenter valuePresenter)