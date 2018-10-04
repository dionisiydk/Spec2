tests
testCreationNewInstanceOnModel

	| new |
	new := presenter createNewOn: model.
	
	self assert: new class equals: presenter class