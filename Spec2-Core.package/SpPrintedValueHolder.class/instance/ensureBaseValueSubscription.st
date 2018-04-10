subscription
ensureBaseValueSubscription

	(baseValueHolder announcer hasSubscriber: self) ifTrue: [ ^self ].
	
	baseValueHolder whenChangedSend: #synchronize to: self