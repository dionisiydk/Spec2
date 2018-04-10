event simulation
simulateTextChange: newValue

	self showNewText: newValue.
	
	changesSubscriber perform: handlerSelector