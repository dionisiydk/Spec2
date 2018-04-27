tests
testCreationNewInstanceOnModelShouldNotShareFields

	| new |
	new := presenter createNewOn: model.
	
	self deny: new fields == presenter fields