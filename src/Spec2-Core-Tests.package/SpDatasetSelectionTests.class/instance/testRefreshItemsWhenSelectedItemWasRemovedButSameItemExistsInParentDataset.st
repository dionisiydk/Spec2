tests
testRefreshItemsWhenSelectedItemWasRemovedButSameItemExistsInParentDataset

	| parentItem parentActualItems |
	parentActualItems := dataset actualItems.
	parentItem := dataset itemAt: 1.
	parentItem dataSourceItem defaultChildren: parentActualItems.
	parentItem expand.
	
	selection selectItemsAt: #(2).
	self assert: selection actualItems equals: { parentActualItems first }.
	
	parentItem childrenDataset dataSource actualItems: parentActualItems allButFirst.
	selection refreshItems.
	
	self assert: selection items isEmpty