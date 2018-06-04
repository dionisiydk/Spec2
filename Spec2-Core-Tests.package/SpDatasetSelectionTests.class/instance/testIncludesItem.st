tests
testIncludesItem
	
	selection selectItemsAt: #(1 2).
	
	self assert: (selection includesItem: selection items first).
	self assert: (selection includesItem: (dataset itemAt: 1)).
	self deny: (selection includesItem: (dataset itemAt: 3))