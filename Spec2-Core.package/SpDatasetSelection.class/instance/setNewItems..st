initialization
setNewItems: datasetItems

	| oldItems |
	oldItems := items.
	items := datasetItems.
	announcer announce: (ValueChanged oldValue: oldItems newValue: items)