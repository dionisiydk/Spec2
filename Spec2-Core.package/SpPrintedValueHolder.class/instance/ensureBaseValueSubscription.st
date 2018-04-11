subscription
ensureBaseValueSubscription

	(baseValueHolder announcer hasSubscriber: self) ifTrue: [ ^self ].
	
	baseValueHolder whenChangedSend: #synchronize to: self.
	self synchronizeSilently. "we should always be in sync with vase value when some observer is subscribed"