commands
createCommandContextFor: aDatasetItem 

	| activeSelection selectedItems |
	activeSelection := selections 
		detect: [ :each | each extendsContextOf: aDatasetItem ]
		ifNone: [ ^itemContextClass for: self selectedItems: { aDatasetItem }].
		
	selectedItems := activeSelection itemsExtendingContextOf: aDatasetItem.
	^itemContextClass for: self selectedItems: selectedItems