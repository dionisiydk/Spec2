subscription
ensureBaseValueSubscription

	(baseValueHolder announcer hasSubscriber: self) ifTrue: [ ^self ].
	
	baseValueHolder whenChangedSend: #synchronize to: self.
	self synchronize. "we should always sync value when observer is subscribed"