tests
testRefreshItemsWhenSelectedItemWasRemoved

	| actualSelectedItems |
	actualSelectedItems := {dataset actualItems first. dataset actualItems third}.	
	selection selectItemsWith: actualSelectedItems.
	dataset dataSource actualItems: dataset actualItems allButFirst.
	
	selection refreshItems.
	
	self assert: selection items size equals: 1.
	self assert: selection actualItems equals: actualSelectedItems allButFirst