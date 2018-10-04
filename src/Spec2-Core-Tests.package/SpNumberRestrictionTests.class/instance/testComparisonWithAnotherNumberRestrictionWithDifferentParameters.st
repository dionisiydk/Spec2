tests
testComparisonWithAnotherNumberRestrictionWithDifferentParameters

	| restriction2 |
	restriction2 := SpNumberRestriction minValue: 10 maxValue: 20.
	
	self deny: restriction = restriction2