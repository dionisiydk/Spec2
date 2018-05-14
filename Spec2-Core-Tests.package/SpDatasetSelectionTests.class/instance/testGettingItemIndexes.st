tests
testGettingItemIndexes
	
	selection selectItemsWith: { dataset actualItems first. dataset actualItems at: 3}.
	
	self assert: selection itemIndexes equals: #(1 3)