subscription
whenChangedDo: aBlock
	super whenChangedDo: aBlock.
	
	self ensureBaseValueSubscription