controlling
selectItemsWith: actualItems 
	| oldItems newItems |
	oldItems := items.
	newItems := rootDataset itemsWith: actualItems.
	items := newItems reject: [ :each | each isNil ]. "missing items are returned as nil in their position"
	announcer announce: (ValueChanged oldValue: oldItems newValue: items)