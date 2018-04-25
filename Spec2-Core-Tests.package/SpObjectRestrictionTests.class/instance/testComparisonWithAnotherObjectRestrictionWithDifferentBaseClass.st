tests
testComparisonWithAnotherObjectRestrictionWithDifferentBaseClass

	| restriction2 |
	restriction2 := SpObjectRestriction baseClass: Number.
	
	self deny: restriction = restriction2