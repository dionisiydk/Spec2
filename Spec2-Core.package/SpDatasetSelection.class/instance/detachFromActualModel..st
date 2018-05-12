attached model
detachFromActualModel: aValueHolder

	announcer unsubscribe: aValueHolder.		
	aValueHolder unsubscribe: self