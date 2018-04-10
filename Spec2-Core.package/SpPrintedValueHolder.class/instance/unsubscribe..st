subscription
unsubscribe: anObject
	
	super unsubscribe: anObject.
	
	announcer numberOfSubscriptions = 0 ifTrue: [ 
		baseValueHolder unsubscribe: self ]