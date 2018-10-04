tests
testDecoratingRemovalOfOneAsterixValue

	| actual |
	decoration mask: '8(***)***-**-**'.

	actual := decoration decorateInsertionOf: '' into: '8(ABC)D**-**-**' from: 5 to: 6.
		
	self assert: actual equals: '8(AB*)D**-**-**'