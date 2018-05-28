tests
testRefreshItemsWhenSelectedItemChangedIndex
	
	| actualSelectedItems |
	actualSelectedItems := {dataset actualItems first. dataset actualItems third}.
	selection selectItemsWith: actualSelectedItems.
	dataset dataSource actualItems: #(-100), dataset actualItems.
	
	selection refreshItems.
	
	self assert: selection items size equals: 2.
	self assert: selection actualItems equals: actualSelectedItems.
	self assert: selection items first dataSourceItem index equals: 2.