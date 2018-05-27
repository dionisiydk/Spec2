controlling
itemWasCollapsed: aDatasetItem 
	expandedItems remove: aDatasetItem.
	
	self announceChanges