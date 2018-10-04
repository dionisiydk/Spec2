tests
testIsEmpty
	
	self assert: selection isEmpty.
	
	selection selectItemsWith: {dataset actualItems first}.
	
	self deny: selection isEmpty