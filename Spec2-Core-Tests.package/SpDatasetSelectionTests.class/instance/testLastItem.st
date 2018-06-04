tests
testLastItem
	
	selection selectItemsAt: #(3 1).
	
	self assert: selection lastItem globalIndex equals: 1