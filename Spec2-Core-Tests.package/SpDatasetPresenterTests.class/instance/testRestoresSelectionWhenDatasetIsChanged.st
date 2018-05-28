tests
testRestoresSelectionWhenDatasetIsChanged
	
	| itemsBeforeUpdate selection |
	selection := presenter addSelection: SpManualSelection new.
	selection selectItemsWith: { model dataSource actualItems second }.
	
	itemsBeforeUpdate := selection items.
	
	model announceChanges. 
	
	self deny: selection items = itemsBeforeUpdate.
	self assert: selection actualItems equals: { model dataSource actualItems second }