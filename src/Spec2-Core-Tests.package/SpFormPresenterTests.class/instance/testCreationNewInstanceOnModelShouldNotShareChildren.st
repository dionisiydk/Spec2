tests
testCreationNewInstanceOnModelShouldNotShareChildren

	| new |
	new := presenter createNewOn: model.
	
	self deny: new children == presenter children