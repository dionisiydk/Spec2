controlling
selectItemsWith: actualItems 
	| oldItems |
	oldItems := items.
	items := rootDataset itemsWith: actualItems.
	announcer announce: (ValueChanged oldValue: oldItems newValue: items)