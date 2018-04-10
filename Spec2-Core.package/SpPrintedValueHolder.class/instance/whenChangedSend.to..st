subscription
whenChangedSend: aSelector to: aReceiver
	super whenChangedSend: aSelector to: aReceiver.
	
	self ensureBaseValueSubscription	