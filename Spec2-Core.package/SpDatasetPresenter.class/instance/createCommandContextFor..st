commands
createCommandContextFor: aDatasetItem 
	^SpDatasetContext for: self selectedItems: { aDatasetItem }