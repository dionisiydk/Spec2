tests
testDecoratingSingleCharacterInsertionAtSecondAsterix
	| actual |
	decoration mask: '8(***)***-**-**'.

	actual := decoration decorateInsertionOf: 'A' into: decoration mask from: 4 to: 3.
	
	self assert: actual equals: '8(*A*)***-**-**'