controlling
toggleItem: aDatasetItem

	(self includesItem: aDatasetItem)
		ifTrue: [ self deselectItem: aDatasetItem ]
		ifFalse: [ self addNewItem: aDatasetItem ]