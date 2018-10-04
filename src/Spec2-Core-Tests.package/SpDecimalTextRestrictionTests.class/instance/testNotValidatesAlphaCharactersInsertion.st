tests
testNotValidatesAlphaCharactersInsertion

	| actual |
	actual := restriction validateInsertionOf: 'aa' into: '1234' from: 1 to: 2.
	
	self deny: actual