actual model syncronization
attachToActualModel: aValueHolder
	"This method establishes synchronous state 
	between selection and actual items from given aValueHolder.
	Selection items are instances of SpDatasetItem but given model represent actual objects. 
	So during synchronization selection passes internal actual items as value to given value holder"
	announcer 
		when: ValueChanged 
		do: [ self synchronizeActualModel: aValueHolder ] 
		for: aValueHolder.
		
	aValueHolder whenChangedSend: #selectActualItemsFromEvent: to: self