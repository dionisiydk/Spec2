controlling
refreshItems

	| updatedItems groups liveItems |
	
	updatedItems := OrderedCollection new: items size.
	liveItems := items reject: [:each | each isRemoved ].
	groups := liveItems groupedBy: [ :each | each ownerDataset ].
	groups keysAndValuesDo: [ :dataset :localItems | 
		updatedItems addAll: (dataset refreshItems: localItems)].

	self setNewItems: updatedItems