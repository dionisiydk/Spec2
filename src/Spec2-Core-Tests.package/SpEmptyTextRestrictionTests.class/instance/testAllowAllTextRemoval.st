tests
testAllowAllTextRemoval

	| actual |
	actual := restriction validateInsertionOf: '' into: '12' from: 1 to: 2.
	self assert: actual