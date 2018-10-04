tests
testDecoratingInsertion
	
	| actual |
	
	actual := decoration decorateInsertionOf: 'some string' into: '123456' from: 2 to: 4.
	
	self assert: actual equals: '1some string56'