tests
testComposingWithAnotherRestrictionByAnd

	| actual restriction2 |
	restriction2 := self createRestriction.
	
	actual := restriction & restriction2.
	
	self assert: actual class equals: SpAndRestriction.
	self assert: actual option1 equals: restriction.
	self assert: actual option2 equals: restriction2.