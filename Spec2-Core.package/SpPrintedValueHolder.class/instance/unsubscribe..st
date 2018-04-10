subscription
unsubscribe: anObject
	
	self announcer unsubscribe: anObject.
	
	announcer numberOfSubscriptions = 0 ifTrue: [ 
		baseValueHolder announcer unsubscribe: self ]