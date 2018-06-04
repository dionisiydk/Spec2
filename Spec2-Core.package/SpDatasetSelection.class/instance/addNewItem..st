controlling
addNewItem: aDatasetItem 
	(indexCache includesKey: aDatasetItem globalIndex)
		ifTrue: [ self error: 'Item at ', aDatasetItem globalIndex asString, ' is already selected!' ].
		
	self setNewItems: (items copyWith: aDatasetItem)