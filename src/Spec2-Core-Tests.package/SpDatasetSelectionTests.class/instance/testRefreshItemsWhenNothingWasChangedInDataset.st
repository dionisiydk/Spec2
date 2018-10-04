tests
testRefreshItemsWhenNothingWasChangedInDataset
	
	| beforeRefresh |
	selection selectItemsWith: { dataset actualItems first. dataset actualItems third }.
	beforeRefresh := selection items.
	
	selection refreshItems.
	
	self deny: selection items = beforeRefresh.
	self assert: selection actualItems equals: { dataset actualItems first. dataset actualItems third }