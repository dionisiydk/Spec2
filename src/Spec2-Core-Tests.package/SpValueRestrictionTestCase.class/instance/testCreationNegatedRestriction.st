tests
testCreationNegatedRestriction

	| actual |
	actual := restriction class not.
	
	self assert: actual class equals: SpNotRestriction.
	self assert: actual actualRestriction equals: restriction class new.