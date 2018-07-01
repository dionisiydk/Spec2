commands
createCommandContextFor: aDatasetItem 

	| activeSelection selectedItems |
	activeSelection := selections 
		detect: [ :each | each extendsContextOf: aDatasetItem ]
		ifNone: [ ^SpDatasetContext for: self selectedItems: { aDatasetItem }].
		
	selectedItems := activeSelection itemsExtendingContextOf: aDatasetItem.
	^SpDatasetContext for: self selectedItems: selectedItems