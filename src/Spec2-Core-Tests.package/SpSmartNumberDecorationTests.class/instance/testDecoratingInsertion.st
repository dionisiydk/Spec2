tests
testDecoratingInsertion
	
	| decoratedInsertion nativeInsertion |
	nativeInsertion := '10 000' copyReplaceFrom: 4 to: 3 with: '9'.
	self assert: nativeInsertion equals: '10 9000'.
	
	decoratedInsertion := decoration decorateInsertionOf: '9' into: '10 000' from: 4 to: 3.
	
	self assert: decoratedInsertion equals: '109 000'.