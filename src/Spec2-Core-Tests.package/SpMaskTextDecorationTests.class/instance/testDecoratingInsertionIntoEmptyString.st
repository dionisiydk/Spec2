tests
testDecoratingInsertionIntoEmptyString

	| actual |
	decoration mask: '8(***)***-**-**'.

	actual := decoration decorateInsertionOf: 'ABC' into: '' from: 4 to: 3.
	
	self assert: actual equals: '8(*AB)C**-**-**'