event simulation
simulateTextChange: newValue

	contents := newValue.
	
	changesSubscriber perform: handlerSelector