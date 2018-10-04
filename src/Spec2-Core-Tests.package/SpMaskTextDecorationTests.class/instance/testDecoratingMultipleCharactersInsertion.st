tests
testDecoratingMultipleCharactersInsertion
	| actual |
	decoration mask: '8(***)***-**-**'.

	actual := decoration decorateInsertionOf: 'ABCD' into: decoration mask from: 1 to: 0.
	
	self assert: actual equals: '8(ABC)D**-**-**'