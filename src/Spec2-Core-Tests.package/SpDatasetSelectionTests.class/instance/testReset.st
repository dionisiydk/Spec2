tests
testReset
	
	selection selectItemsAt: #(1 2).
	
	selection reset.
	
	self assert: selection isEmpty