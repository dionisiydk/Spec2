tests
testCollapseAtItemWhichWasNotSelected
	
	selection selectItemsWith: #(1).
	
	selection collapseAtItem: (dataset itemAt: 3).
	
	self assert: selection size equals: 1.
	self assert: selection actualItems equals: #(3)