tests
testCollapseAtItemWhichWasOnlySelected
	
	selection selectItemsWith: #(1).
	
	selection collapseAtItem: (dataset itemAt: 1).
	
	self assert: selection isEmpty