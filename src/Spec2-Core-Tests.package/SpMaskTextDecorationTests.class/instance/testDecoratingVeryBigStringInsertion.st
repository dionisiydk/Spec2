tests
testDecoratingVeryBigStringInsertion

	| actual |
	decoration mask: '1**4**7*'.

	actual := decoration decorateInsertionOf: 'ABCDEFGHIJ' into: decoration mask from: 1 to: 0.
	
	self assert: actual equals: '1AB4CD7E'