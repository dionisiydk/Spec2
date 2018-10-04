controlling
collapse

	childrenDataset ifNil: [ ^self ].
	
	childrenDataset close.
	childrenDataset := nil.
	
	ownerDataset itemWasCollapsed: self