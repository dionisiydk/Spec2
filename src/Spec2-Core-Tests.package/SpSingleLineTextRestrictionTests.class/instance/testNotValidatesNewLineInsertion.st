tests
testNotValidatesNewLineInsertion

	| actual |
	actual := restriction validateInsertionOf: String cr into: 'some text' from: 1 to: 2.
	
	self deny: actual