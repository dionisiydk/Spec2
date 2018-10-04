tests
testForbidAnyTextInsertion

	| actual |
	actual := restriction validateInsertionOf: 'new text' into: '' from: 1 to: 0.
	self deny: actual