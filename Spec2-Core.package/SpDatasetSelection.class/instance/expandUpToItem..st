controlling
expandUpToItem: aDatasetItem
	
	| addedItems newRegion oldItems |
	self isEmpty ifTrue: [ ^self setNewItems: { aDatasetItem } ].
	
	newRegion := self lastItem globalIndex < aDatasetItem globalIndex
		ifTrue: [ self lastItem globalIndex + 1 to: aDatasetItem globalIndex ]
		ifFalse: [ self lastItem globalIndex - 1 to: aDatasetItem globalIndex by: -1 ].
		
	addedItems := newRegion collect: [:each | rootDataset itemAt: each].
	oldItems := items as: OrderedCollection.
	addedItems do: [ :each | 
		indexCache at: each globalIndex ifPresent: [ :existing | oldItems remove: existing ] ].
	self setNewItems: oldItems , addedItems