tests
testLayoutAllFields

	self assert: presenter children equals: presenter fields asIdentitySet.
	
	self assert: presenter view contents size equals: presenter fields size