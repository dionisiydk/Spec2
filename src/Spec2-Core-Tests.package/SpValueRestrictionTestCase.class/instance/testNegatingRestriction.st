tests
testNegatingRestriction

	| actual |
	actual := restriction not.
	
	self assert: actual class equals: SpNotRestriction.
	self assert: actual actualRestriction equals: restriction.