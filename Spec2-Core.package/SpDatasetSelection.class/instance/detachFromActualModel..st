actual model syncronization
detachFromActualModel: aValueHolder

	announcer unsubscribe: aValueHolder.		
	aValueHolder unsubscribe: self