tests
testSelectingItemsByIndex
	
	| expectedItems |
	
	selection selectItemsAt: #(1 3).

	expectedItems := { dataset actualItems first. dataset actualItems third }.	
	self assert: selection actualItems equals: expectedItems