controlling
deselectItem: aDatasetItem

	| selectedItem |
	selectedItem := indexCache at: aDatasetItem globalIndex.
	
	self setNewItems: (items copyWithout: selectedItem)