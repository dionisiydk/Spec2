controlling
collapseAtItem: aDatasetItem

	(self size = 1 and: [self includesItem: aDatasetItem])
		ifTrue: [ self reset ]
		ifFalse: [ self setNewItems: { aDatasetItem } ]