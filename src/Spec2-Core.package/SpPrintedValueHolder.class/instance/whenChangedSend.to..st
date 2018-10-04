subscription
whenChangedSend: aSelector to: aSubscriber
	super whenChangedSend: aSelector to: aSubscriber.
	
	self ensureBaseValueSubscription	